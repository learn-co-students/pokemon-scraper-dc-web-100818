require_relative "environment"

Scraper.new(@db).scrape

all_pokemon = @db.execute("SELECT * FROM pokemon;")

Pokemon.new(1, "Pikachu", "electric", @db)