defmodule Languages.Repo.Migrations.CreateWordTablesForLanguages do
  use Ecto.Migration

  def change do
    create table(:abkhaz_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:abkhaz_words, [:word])

    create table(:afar_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:afar_words, [:word])

    create table(:afrikaans_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:afrikaans_words, [:word])

    create table(:albanian_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:albanian_words, [:word])

    create table(:amharic_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:amharic_words, [:word])

    create table(:arabic_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:arabic_words, [:word])

    create table(:araona_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:araona_words, [:word])

    create table(:armenian_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:armenian_words, [:word])

    create table(:ashaninka_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:ashaninka_words, [:word])

    create table(:aymara_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:aymara_words, [:word])

    create table(:azerbaijani_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:azerbaijani_words, [:word])

    create table(:bambara_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:bambara_words, [:word])

    create table(:bari_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:bari_words, [:word])

    create table(:baure_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:baure_words, [:word])

    create table(:belarusian_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:belarusian_words, [:word])

    create table(:belter_creole_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:belter_creole_words, [:word])

    create table(:bengali_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:bengali_words, [:word])

    create table(:benshangul_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:benshangul_words, [:word])

    create table(:berber_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:berber_words, [:word])

    create table(:besiro_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:besiro_words, [:word])

    create table(:bislama_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:bislama_words, [:word])

    create table(:bobo_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:bobo_words, [:word])

    create table(:bokmal_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:bokmal_words, [:word])

    create table(:bosnian_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:bosnian_words, [:word])

    create table(:bozo_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:bozo_words, [:word])

    create table(:bulgarian_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:bulgarian_words, [:word])

    create table(:burmese_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:burmese_words, [:word])

    create table(:canichana_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:canichana_words, [:word])

    create table(:cantonese_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:cantonese_words, [:word])

    create table(:cape_verdean_creole_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:cape_verdean_creole_words, [:word])

    create table(:castilian_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:castilian_words, [:word])

    create table(:catalan_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:catalan_words, [:word])

    create table(:cavinena_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:cavinena_words, [:word])

    create table(:cayubaba_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:cayubaba_words, [:word])

    create table(:chacobo_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:chacobo_words, [:word])

    create table(:chewa_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:chewa_words, [:word])

    create table(:chibarwe_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:chibarwe_words, [:word])

    create table(:chichewa_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:chichewa_words, [:word])

    create table(:chilean_spanish_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:chilean_spanish_words, [:word])

    create table(:chiman_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:chiman_words, [:word])

    create table(:chokwe_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:chokwe_words, [:word])

    create table(:cocos_malay_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:cocos_malay_words, [:word])

    create table(:comorian_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:comorian_words, [:word])

    create table(:cook_islands_maori_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:cook_islands_maori_words, [:word])

    create table(:croatian_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:croatian_words, [:word])

    create table(:cypriot_arabic_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:cypriot_arabic_words, [:word])

    create table(:czech_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:czech_words, [:word])

    create table(:danish_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:danish_words, [:word])

    create table(:dhivehi_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:dhivehi_words, [:word])

    create table(:dinka_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:dinka_words, [:word])

    create table(:dogon_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:dogon_words, [:word])

    create table(:dothraki_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:dothraki_words, [:word])

    create table(:dutch_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:dutch_words, [:word])

    create table(:dzongkha_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:dzongkha_words, [:word])

    create table(:egyptian_arabic_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:egyptian_arabic_words, [:word])

    create table(:english_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:english_words, [:word])

    create table(:ese_ejja_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:ese_ejja_words, [:word])

    create table(:estonian_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:estonian_words, [:word])

    create table(:fiji_hindi_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:fiji_hindi_words, [:word])

    create table(:fijian_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:fijian_words, [:word])

    create table(:filipino_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:filipino_words, [:word])

    create table(:finnish_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:finnish_words, [:word])

    create table(:french_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:french_words, [:word])

    create table(:fula_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:fula_words, [:word])

    create table(:fulfulde_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:fulfulde_words, [:word])

    create table(:ganguela_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:ganguela_words, [:word])

    create table(:georgian_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:georgian_words, [:word])

    create table(:german_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:german_words, [:word])

    create table(:gilbertese_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:gilbertese_words, [:word])

    create table(:greek_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:greek_words, [:word])

    create table(:guarani_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:guarani_words, [:word])

    create table(:guarasu_we_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:guarasu_we_words, [:word])

    create table(:guarayu_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:guarayu_words, [:word])

    create table(:gulmancema_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:gulmancema_words, [:word])

    create table(:gumuz_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:gumuz_words, [:word])

    create table(:haitian_creole_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:haitian_creole_words, [:word])

    create table(:harari_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:harari_words, [:word])

    create table(:hassaniya_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:hassaniya_words, [:word])

    create table(:hausa_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:hausa_words, [:word])

    create table(:hebrew_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:hebrew_words, [:word])

    create table(:hiri_motu_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:hiri_motu_words, [:word])

    create table(:hungarian_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:hungarian_words, [:word])

    create table(:icelandic_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:icelandic_words, [:word])

    create table(:igbo_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:igbo_words, [:word])

    create table(:indonesian_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:indonesian_words, [:word])

    create table(:irish_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:irish_words, [:word])

    create table(:italian_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:italian_words, [:word])

    create table(:itonama_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:itonama_words, [:word])

    create table(:jamaican_patois_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:jamaican_patois_words, [:word])

    create table(:japanese_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:japanese_words, [:word])

    create table(:jola_fogny_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:jola_fogny_words, [:word])

    create table(:jula_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:jula_words, [:word])

    create table(:kalanga_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:kalanga_words, [:word])

    create table(:kanuri_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:kanuri_words, [:word])

    create table(:kassonke_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:kassonke_words, [:word])

    create table(:kazakh_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:kazakh_words, [:word])

    create table(:khmer_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:khmer_words, [:word])

    create table(:khoisan_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:khoisan_words, [:word])

    create table(:kikongo_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:kikongo_words, [:word])

    create table(:kimbundu_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:kimbundu_words, [:word])

    create table(:kinyarwanda_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:kinyarwanda_words, [:word])

    create table(:kirundi_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:kirundi_words, [:word])

    create table(:klingon_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:klingon_words, [:word])

    create table(:korean_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:korean_words, [:word])

    create table(:krio_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:krio_words, [:word])

    create table(:kunama_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:kunama_words, [:word])

    create table(:kurdish_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:kurdish_words, [:word])

    create table(:kuwaiti_arabic_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:kuwaiti_arabic_words, [:word])

    create table(:kuwaiti_persian_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:kuwaiti_persian_words, [:word])

    create table(:kwanyama_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:kwanyama_words, [:word])

    create table(:kyrgyz_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:kyrgyz_words, [:word])

    create table(:lao_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:lao_words, [:word])

    create table(:latin_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:latin_words, [:word])

    create table(:latvian_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:latvian_words, [:word])

    create table(:leco_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:leco_words, [:word])

    create table(:lithuanian_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:lithuanian_words, [:word])

    create table(:luo_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:luo_words, [:word])

    create table(:luxembourgish_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:luxembourgish_words, [:word])

    create table(:macedonian_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:macedonian_words, [:word])

    create table(:machajuyai_kallawaya_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:machajuyai_kallawaya_words, [:word])

    create table(:machineri_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:machineri_words, [:word])

    create table(:malagasy_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:malagasy_words, [:word])

    create table(:malay_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:malay_words, [:word])

    create table(:maltese_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:maltese_words, [:word])

    create table(:mandarin_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:mandarin_words, [:word])

    create table(:mandinka_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:mandinka_words, [:word])

    create table(:maninke_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:maninke_words, [:word])

    create table(:maori_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:maori_words, [:word])

    create table(:maropa_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:maropa_words, [:word])

    create table(:marshallese_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:marshallese_words, [:word])

    create table(:mauritian_creole_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:mauritian_creole_words, [:word])

    create table(:minyanka_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:minyanka_words, [:word])

    create table(:mojeno_ignaciano_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:mojeno_ignaciano_words, [:word])

    create table(:mojeno_trinitario_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:mojeno_trinitario_words, [:word])

    create table(:moldovan_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:moldovan_words, [:word])

    create table(:mongolian_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:mongolian_words, [:word])

    create table(:montenegrin_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:montenegrin_words, [:word])

    create table(:moore_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:moore_words, [:word])

    create table(:moseten_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:moseten_words, [:word])

    create table(:movima_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:movima_words, [:word])

    create table(:murle_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:murle_words, [:word])

    create table(:nambya_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:nambya_words, [:word])

    create table(:nauruan_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:nauruan_words, [:word])

    create table(:ndau_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:ndau_words, [:word])

    create table(:ndebele_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:ndebele_words, [:word])

    create table(:nepali_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:nepali_words, [:word])

    create table(:niuean_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:niuean_words, [:word])

    create table(:norfuk_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:norfuk_words, [:word])

    create table(:northern_sotho_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:northern_sotho_words, [:word])

    create table(:norwegian_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:norwegian_words, [:word])

    create table(:nuer_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:nuer_words, [:word])

    create table(:nynorsk_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:nynorsk_words, [:word])

    create table(:oromo_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:oromo_words, [:word])

    create table(:ossetian_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:ossetian_words, [:word])

    create table(:pacawara_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:pacawara_words, [:word])

    create table(:palauan_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:palauan_words, [:word])

    create table(:pashto_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:pashto_words, [:word])

    create table(:persian_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:persian_words, [:word])

    create table(:peruvian_spanish_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:peruvian_spanish_words, [:word])

    create table(:polish_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:polish_words, [:word])

    create table(:portugese_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:portugese_words, [:word])

    create table(:pulaar_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:pulaar_words, [:word])

    create table(:puquina_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:puquina_words, [:word])

    create table(:quechua_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:quechua_words, [:word])

    create table(:quenya_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:quenya_words, [:word])

    create table(:romani_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:romani_words, [:word])

    create table(:romanian_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:romanian_words, [:word])

    create table(:romansh_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:romansh_words, [:word])

    create table(:romulan_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:romulan_words, [:word])

    create table(:russian_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:russian_words, [:word])

    create table(:sami_languages_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:sami_languages_words, [:word])

    create table(:samoan_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:samoan_words, [:word])

    create table(:sango_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:sango_words, [:word])

    create table(:senufo_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:senufo_words, [:word])

    create table(:serbian_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:serbian_words, [:word])

    create table(:serer_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:serer_words, [:word])

    create table(:seychellois_creole_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:seychellois_creole_words, [:word])

    create table(:shangani_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:shangani_words, [:word])

    create table(:shona_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:shona_words, [:word])

    create table(:sidamo_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:sidamo_words, [:word])

    create table(:sindarin_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:sindarin_words, [:word])

    create table(:sinhala_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:sinhala_words, [:word])

    create table(:siriono_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:siriono_words, [:word])

    create table(:slovak_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:slovak_words, [:word])

    create table(:slovene_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:slovene_words, [:word])

    create table(:somali_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:somali_words, [:word])

    create table(:songhay_languages_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:songhay_languages_words, [:word])

    create table(:soninke_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:soninke_words, [:word])

    create table(:sotho_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:sotho_words, [:word])

    create table(:southern_ndebele_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:southern_ndebele_words, [:word])

    create table(:spanish_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:spanish_words, [:word])

    create table(:spnaish_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:spnaish_words, [:word])

    create table(:sranan_tongo_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:sranan_tongo_words, [:word])

    create table(:standard_arabic_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:standard_arabic_words, [:word])

    create table(:swahili_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:swahili_words, [:word])

    create table(:swazi_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:swazi_words, [:word])

    create table(:swedish_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:swedish_words, [:word])

    create table(:tacana_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:tacana_words, [:word])

    create table(:tajik_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:tajik_words, [:word])

    create table(:tamasheq_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:tamasheq_words, [:word])

    create table(:tamazight_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:tamazight_words, [:word])

    create table(:tamil_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:tamil_words, [:word])

    create table(:tapiete_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:tapiete_words, [:word])

    create table(:tetum_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:tetum_words, [:word])

    create table(:thai_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:thai_words, [:word])

    create table(:tigrinya_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:tigrinya_words, [:word])

    create table(:tiv_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:tiv_words, [:word])

    create table(:tok_pisin_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:tok_pisin_words, [:word])

    create table(:tokelauan_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:tokelauan_words, [:word])

    create table(:tonga_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:tonga_words, [:word])

    create table(:tongan_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:tongan_words, [:word])

    create table(:toromona_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:toromona_words, [:word])

    create table(:tshiluba_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:tshiluba_words, [:word])

    create table(:tsonga_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:tsonga_words, [:word])

    create table(:tswana_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:tswana_words, [:word])

    create table(:turkish_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:turkish_words, [:word])

    create table(:turkmen_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:turkmen_words, [:word])

    create table(:tuvaluan_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:tuvaluan_words, [:word])

    create table(:ukrainian_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:ukrainian_words, [:word])

    create table(:umbundu_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:umbundu_words, [:word])

    create table(:urdu_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:urdu_words, [:word])

    create table(:uru_chipaya_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:uru_chipaya_words, [:word])

    create table(:uzbek_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:uzbek_words, [:word])

    create table(:venda_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:venda_words, [:word])

    create table(:vietnamese_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:vietnamese_words, [:word])

    create table(:vulcan_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:vulcan_words, [:word])

    create table(:weenhayek_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:weenhayek_words, [:word])

    create table(:welsh_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:welsh_words, [:word])

    create table(:wolof_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:wolof_words, [:word])

    create table(:xhosa_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:xhosa_words, [:word])

    create table(:yaminawa_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:yaminawa_words, [:word])

    create table(:yoruba_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:yoruba_words, [:word])

    create table(:yuki_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:yuki_words, [:word])

    create table(:yuracare_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:yuracare_words, [:word])

    create table(:zamuco_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:zamuco_words, [:word])

    create table(:zande_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:zande_words, [:word])

    create table(:zarma_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:zarma_words, [:word])

    create table(:zulu_words, primary_key: false) do
      add :id, :string, primary_key: true
      add :word, :string, unique: true, null: false
      add :user_id, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:zulu_words, [:word])
  end
end
