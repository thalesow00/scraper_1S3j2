#Ajoute dans spec/scraper_spec.rb pour vérifier que le scraper fonctionne :
require "rspec"
require_relative "../lib/scraper"

describe CryptoScraper do
  it "récupère bien un array de cryptos" do
    expect(CryptoScraper.scrape).to be_an(Array)
  end

  it "contient au moins 10 cryptos" do
    expect(CryptoScraper.scrape.size).to be >= 10
  end
end
