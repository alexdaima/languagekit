use std::collections::HashSet;
use std::env;
use std::fs::{self, File};
use std::io::BufReader;
use std::path::{Path, PathBuf};

use anyhow::{Result, anyhow};
use csv::ReaderBuilder;
use rusqlite::{Connection, params};
use serde::Deserialize;
use walkdir::WalkDir;

// CSV row structures for each table

#[derive(Debug, Deserialize)]
struct ConceptRow {
    id: String,
    pos: String,
    en_definition: String,
    zh_hans_definition: String,
}

#[derive(Debug, Deserialize)]
struct EnWordRow {
    word: String,
    british_spelling: Option<String>,
}

#[derive(Debug, Deserialize)]
struct EnBridgeRow {
    word: String,
    bridge: String,
}

#[derive(Debug, Deserialize)]
struct ZhHansWordRow {
    word: String,
}

#[derive(Debug, Deserialize)]
struct ZhHansBridgeRow {
    word: String,
    bridge: String,
    pinyin: Option<String>,
}

fn main() -> Result<()> {
    println!("cargo:rerun-if-changed=build.rs");
    println!("cargo:rerun-if-changed=schemas.sql");
    println!("cargo:rerun-if-changed=data");

    let manifest_dir = PathBuf::from(env::var("CARGO_MANIFEST_DIR")?);
    let data_dir = manifest_dir.join("data");
    let schema_file = manifest_dir.join("schemas.sql");

    let mut errors: Vec<String> = Vec::new();

    if !schema_file.exists() {
        errors.push("schemas.sql file is missing".to_owned());
    }

    if !data_dir.exists() {
        errors.push("data directory './data' is missing".to_owned());
    } else if !data_dir.is_dir() {
        errors.push("data path './data' exists but is not a directory".to_owned());
    } else {
        emit_rerun_directives(&data_dir);

        // Load and validate all CSV data
        let concepts = load_concepts(&data_dir, &mut errors);
        let concept_ids: HashSet<String> =
            concepts.iter().map(|c| c.id.trim().to_owned()).collect();

        let en_words = load_en_words(&data_dir, &mut errors);
        let en_word_set: HashSet<String> =
            en_words.iter().map(|w| w.word.trim().to_owned()).collect();
        let en_bridge = load_en_bridge(&data_dir, &en_word_set, &concept_ids, &mut errors);

        let zh_hans_words = load_zh_hans_words(&data_dir, &mut errors);
        let zh_hans_word_set: HashSet<String> = zh_hans_words
            .iter()
            .map(|w| w.word.trim().to_owned())
            .collect();
        let zh_hans_bridge =
            load_zh_hans_bridge(&data_dir, &zh_hans_word_set, &concept_ids, &mut errors);

        // If validation passed, create the database
        if errors.is_empty() {
            if let Err(e) = create_database(
                &manifest_dir,
                &schema_file,
                &concepts,
                &en_words,
                &en_bridge,
                &zh_hans_words,
                &zh_hans_bridge,
            ) {
                errors.push(format!("Failed to create database: {}", e));
            }
        }
    }

    if errors.is_empty() {
        eprintln!("✅ Data validation and database creation complete!");
        Ok(())
    } else {
        errors.sort();
        errors.dedup();
        for error in &errors {
            println!("cargo:warning={error}");
        }
        Err(anyhow!(
            "data validation failed with {} issue(s)",
            errors.len()
        ))
    }
}

fn load_concepts(data_dir: &Path, errors: &mut Vec<String>) -> Vec<ConceptRow> {
    let path = data_dir.join("concepts.csv");
    let mut records: Vec<ConceptRow> = Vec::new();

    if !path.exists() {
        errors.push(format!("concepts.csv is missing"));
        return records;
    }

    let file = match File::open(&path) {
        Ok(f) => f,
        Err(e) => {
            errors.push(format!("Failed to open concepts.csv: {}", e));
            return records;
        }
    };

    let mut reader = ReaderBuilder::new()
        .has_headers(true)
        .from_reader(BufReader::new(file));

    let mut seen_ids: HashSet<String> = HashSet::new();
    let mut row_num = 1;

    for result in reader.deserialize() {
        row_num += 1;
        let record: ConceptRow = match result {
            Ok(r) => r,
            Err(e) => {
                errors.push(format!(
                    "concepts.csv row {}: failed to parse: {}",
                    row_num, e
                ));
                continue;
            }
        };

        let id = record.id.trim();
        if id.is_empty() {
            errors.push(format!(
                "concepts.csv row {}: 'id' must not be empty",
                row_num
            ));
            continue;
        }

        if seen_ids.contains(id) {
            errors.push(format!(
                "concepts.csv row {}: duplicate id '{}'",
                row_num, id
            ));
        } else {
            seen_ids.insert(id.to_owned());
        }

        if record.pos.trim().is_empty() {
            errors.push(format!(
                "concepts.csv row {}: 'pos' must not be empty",
                row_num
            ));
        }

        if record.en_definition.trim().is_empty() {
            errors.push(format!(
                "concepts.csv row {}: 'en_definition' must not be empty",
                row_num
            ));
        }

        if record.zh_hans_definition.trim().is_empty() {
            errors.push(format!(
                "concepts.csv row {}: 'zh_hans_definition' must not be empty",
                row_num
            ));
        }

        records.push(record);
    }

    eprintln!("📝 Loaded {} concepts", records.len());
    records
}

fn load_en_words(data_dir: &Path, errors: &mut Vec<String>) -> Vec<EnWordRow> {
    let path = data_dir.join("en_words.csv");
    let mut records: Vec<EnWordRow> = Vec::new();

    if !path.exists() {
        errors.push(format!("en_words.csv is missing"));
        return records;
    }

    let file = match File::open(&path) {
        Ok(f) => f,
        Err(e) => {
            errors.push(format!("Failed to open en_words.csv: {}", e));
            return records;
        }
    };

    let mut reader = ReaderBuilder::new()
        .has_headers(true)
        .from_reader(BufReader::new(file));

    let mut seen_words: HashSet<String> = HashSet::new();
    let mut row_num = 1;

    for result in reader.deserialize() {
        row_num += 1;
        let record: EnWordRow = match result {
            Ok(r) => r,
            Err(e) => {
                errors.push(format!(
                    "en_words.csv row {}: failed to parse: {}",
                    row_num, e
                ));
                continue;
            }
        };

        let word = record.word.trim();
        if word.is_empty() {
            errors.push(format!(
                "en_words.csv row {}: 'word' must not be empty",
                row_num
            ));
            continue;
        }

        if seen_words.contains(word) {
            errors.push(format!(
                "en_words.csv row {}: duplicate word '{}'",
                row_num, word
            ));
        } else {
            seen_words.insert(word.to_owned());
        }

        records.push(record);
    }

    eprintln!("📝 Loaded {} English words", records.len());
    records
}

fn load_en_bridge(
    data_dir: &Path,
    valid_words: &HashSet<String>,
    valid_concepts: &HashSet<String>,
    errors: &mut Vec<String>,
) -> Vec<EnBridgeRow> {
    let path = data_dir.join("en_bridge.csv");
    let mut records: Vec<EnBridgeRow> = Vec::new();

    if !path.exists() {
        errors.push(format!("en_bridge.csv is missing"));
        return records;
    }

    let file = match File::open(&path) {
        Ok(f) => f,
        Err(e) => {
            errors.push(format!("Failed to open en_bridge.csv: {}", e));
            return records;
        }
    };

    let mut reader = ReaderBuilder::new()
        .has_headers(true)
        .from_reader(BufReader::new(file));

    let mut seen_pairs: HashSet<(String, String)> = HashSet::new();
    let mut row_num = 1;

    for result in reader.deserialize() {
        row_num += 1;
        let record: EnBridgeRow = match result {
            Ok(r) => r,
            Err(e) => {
                errors.push(format!(
                    "en_bridge.csv row {}: failed to parse: {}",
                    row_num, e
                ));
                continue;
            }
        };

        let word = record.word.trim();
        let bridge = record.bridge.trim();

        if word.is_empty() {
            errors.push(format!(
                "en_bridge.csv row {}: 'word' must not be empty",
                row_num
            ));
            continue;
        }

        if bridge.is_empty() {
            errors.push(format!(
                "en_bridge.csv row {}: 'bridge' must not be empty",
                row_num
            ));
            continue;
        }

        if !valid_words.contains(word) {
            errors.push(format!(
                "en_bridge.csv row {}: word '{}' not found in en_words",
                row_num, word
            ));
        }

        if !valid_concepts.contains(bridge) {
            errors.push(format!(
                "en_bridge.csv row {}: bridge '{}' not found in concepts",
                row_num, bridge
            ));
        }

        let pair = (word.to_owned(), bridge.to_owned());
        if seen_pairs.contains(&pair) {
            errors.push(format!(
                "en_bridge.csv row {}: duplicate entry ({}, {})",
                row_num, word, bridge
            ));
        } else {
            seen_pairs.insert(pair);
        }

        records.push(record);
    }

    eprintln!("📝 Loaded {} English bridge entries", records.len());
    records
}

fn load_zh_hans_words(data_dir: &Path, errors: &mut Vec<String>) -> Vec<ZhHansWordRow> {
    let path = data_dir.join("zh_hans_words.csv");
    let mut records: Vec<ZhHansWordRow> = Vec::new();

    if !path.exists() {
        errors.push(format!("zh_hans_words.csv is missing"));
        return records;
    }

    let file = match File::open(&path) {
        Ok(f) => f,
        Err(e) => {
            errors.push(format!("Failed to open zh_hans_words.csv: {}", e));
            return records;
        }
    };

    let mut reader = ReaderBuilder::new()
        .has_headers(true)
        .from_reader(BufReader::new(file));

    let mut seen_words: HashSet<String> = HashSet::new();
    let mut row_num = 1;

    for result in reader.deserialize() {
        row_num += 1;
        let record: ZhHansWordRow = match result {
            Ok(r) => r,
            Err(e) => {
                errors.push(format!(
                    "zh_hans_words.csv row {}: failed to parse: {}",
                    row_num, e
                ));
                continue;
            }
        };

        let word = record.word.trim();
        if word.is_empty() {
            errors.push(format!(
                "zh_hans_words.csv row {}: 'word' must not be empty",
                row_num
            ));
            continue;
        }

        if seen_words.contains(word) {
            errors.push(format!(
                "zh_hans_words.csv row {}: duplicate word '{}'",
                row_num, word
            ));
        } else {
            seen_words.insert(word.to_owned());
        }

        records.push(record);
    }

    eprintln!("📝 Loaded {} Chinese words", records.len());
    records
}

fn load_zh_hans_bridge(
    data_dir: &Path,
    valid_words: &HashSet<String>,
    valid_concepts: &HashSet<String>,
    errors: &mut Vec<String>,
) -> Vec<ZhHansBridgeRow> {
    let path = data_dir.join("zh_hans_bridge.csv");
    let mut records: Vec<ZhHansBridgeRow> = Vec::new();

    if !path.exists() {
        errors.push(format!("zh_hans_bridge.csv is missing"));
        return records;
    }

    let file = match File::open(&path) {
        Ok(f) => f,
        Err(e) => {
            errors.push(format!("Failed to open zh_hans_bridge.csv: {}", e));
            return records;
        }
    };

    let mut reader = ReaderBuilder::new()
        .has_headers(true)
        .from_reader(BufReader::new(file));

    let mut seen_pairs: HashSet<(String, String)> = HashSet::new();
    let mut row_num = 1;

    for result in reader.deserialize() {
        row_num += 1;
        let record: ZhHansBridgeRow = match result {
            Ok(r) => r,
            Err(e) => {
                errors.push(format!(
                    "zh_hans_bridge.csv row {}: failed to parse: {}",
                    row_num, e
                ));
                continue;
            }
        };

        let word = record.word.trim();
        let bridge = record.bridge.trim();

        if word.is_empty() {
            errors.push(format!(
                "zh_hans_bridge.csv row {}: 'word' must not be empty",
                row_num
            ));
            continue;
        }

        if bridge.is_empty() {
            errors.push(format!(
                "zh_hans_bridge.csv row {}: 'bridge' must not be empty",
                row_num
            ));
            continue;
        }

        if !valid_words.contains(word) {
            errors.push(format!(
                "zh_hans_bridge.csv row {}: word '{}' not found in zh_hans_words",
                row_num, word
            ));
        }

        if !valid_concepts.contains(bridge) {
            errors.push(format!(
                "zh_hans_bridge.csv row {}: bridge '{}' not found in concepts",
                row_num, bridge
            ));
        }

        let pair = (word.to_owned(), bridge.to_owned());
        if seen_pairs.contains(&pair) {
            errors.push(format!(
                "zh_hans_bridge.csv row {}: duplicate entry ({}, {})",
                row_num, word, bridge
            ));
        } else {
            seen_pairs.insert(pair);
        }

        records.push(record);
    }

    eprintln!("📝 Loaded {} Chinese bridge entries", records.len());
    records
}

fn create_database(
    manifest_dir: &Path,
    schema_file: &Path,
    concepts: &[ConceptRow],
    en_words: &[EnWordRow],
    en_bridge: &[EnBridgeRow],
    zh_hans_words: &[ZhHansWordRow],
    zh_hans_bridge: &[ZhHansBridgeRow],
) -> Result<()> {
    let db_path = manifest_dir.join("dictionary.sqlite");

    // Remove existing database to start fresh
    if db_path.exists() {
        fs::remove_file(&db_path)?;
    }

    eprintln!("🗄️  Creating database at {}", db_path.display());

    let conn = Connection::open(&db_path)?;

    // Execute schema SQL
    eprintln!("🏗️  Executing schema from schemas.sql...");
    let schema_sql = fs::read_to_string(schema_file)?;
    conn.execute_batch(&schema_sql)?;

    // Insert concepts
    eprintln!("🌱 Seeding {} concepts...", concepts.len());
    {
        let mut stmt = conn.prepare(
            "INSERT INTO concepts (id, pos, en_definition, zh_hans_definition) VALUES (?1, ?2, ?3, ?4)",
        )?;

        for row in concepts {
            stmt.execute(params![
                row.id.trim(),
                row.pos.trim(),
                row.en_definition.trim(),
                row.zh_hans_definition.trim(),
            ])?;
        }
    }

    // Insert English words
    eprintln!("🌱 Seeding {} English words...", en_words.len());
    {
        let mut stmt =
            conn.prepare("INSERT INTO en_words (word, british_spelling) VALUES (?1, ?2)")?;

        for row in en_words {
            let british = row
                .british_spelling
                .as_ref()
                .map(|s| s.trim())
                .filter(|s| !s.is_empty());
            stmt.execute(params![row.word.trim(), british])?;
        }
    }

    // Insert English bridge entries
    eprintln!("🌱 Seeding {} English bridge entries...", en_bridge.len());
    {
        let mut stmt = conn.prepare("INSERT INTO en_bridge (word, bridge) VALUES (?1, ?2)")?;

        for row in en_bridge {
            stmt.execute(params![row.word.trim(), row.bridge.trim()])?;
        }
    }

    // Insert Chinese words
    eprintln!("🌱 Seeding {} Chinese words...", zh_hans_words.len());
    {
        let mut stmt = conn.prepare("INSERT INTO zh_hans_words (word) VALUES (?1)")?;

        for row in zh_hans_words {
            stmt.execute(params![row.word.trim()])?;
        }
    }

    // Insert Chinese bridge entries
    eprintln!(
        "🌱 Seeding {} Chinese bridge entries...",
        zh_hans_bridge.len()
    );
    {
        let mut stmt =
            conn.prepare("INSERT INTO zh_hans_bridge (word, bridge, pinyin) VALUES (?1, ?2, ?3)")?;

        for row in zh_hans_bridge {
            let pinyin = row
                .pinyin
                .as_ref()
                .map(|s| s.trim())
                .filter(|s| !s.is_empty());
            stmt.execute(params![row.word.trim(), row.bridge.trim(), pinyin])?;
        }
    }

    eprintln!("✅ Database seeding complete!");
    Ok(())
}

fn emit_rerun_directives(data_dir: &Path) {
    for entry in WalkDir::new(data_dir).into_iter().filter_map(|e| e.ok()) {
        if entry.file_type().is_file() {
            println!("cargo:rerun-if-changed={}", entry.path().display());
        }
    }
}
