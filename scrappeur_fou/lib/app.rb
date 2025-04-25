require_relative "scraper"

puts " Récupération des cryptos..."
cryptos = CryptoScraper.scrape

puts cryptos
