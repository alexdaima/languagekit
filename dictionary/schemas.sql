-- Dictionary Database Schema
-- This file defines the complete structure of the dictionary database

PRAGMA foreign_keys = ON;

-- Bridge concepts table: universal concepts that link words across languages
CREATE TABLE IF NOT EXISTS concepts (
    id TEXT PRIMARY KEY,
    pos TEXT NOT NULL,
    en_definition TEXT NOT NULL,
    zh_hans_definition TEXT NOT NULL
);

-- English words table
CREATE TABLE IF NOT EXISTS en_words (
    word TEXT PRIMARY KEY,
    british_spelling TEXT
);

-- English to concepts bridge table
CREATE TABLE IF NOT EXISTS en_bridge (
    word TEXT NOT NULL,
    bridge TEXT NOT NULL,
    PRIMARY KEY (word, bridge),
    FOREIGN KEY (word) REFERENCES en_words(word),
    FOREIGN KEY (bridge) REFERENCES concepts(id)
);

-- Simplified Chinese words table
CREATE TABLE IF NOT EXISTS zh_hans_words (
    word TEXT PRIMARY KEY
);

-- Simplified Chinese to concepts bridge table
CREATE TABLE IF NOT EXISTS zh_hans_bridge (
    word TEXT NOT NULL,
    bridge TEXT NOT NULL,
    pinyin TEXT,
    PRIMARY KEY (word, bridge),
    FOREIGN KEY (word) REFERENCES zh_hans_words(word),
    FOREIGN KEY (bridge) REFERENCES concepts(id)
);
