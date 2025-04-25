#Dans lib/scraper.rb, on va récupérer les données de CoinMarketCap :
require "nokogiri"
require "open-uri"

class CryptoScraper
  URL = "https://coinmarketcap.com/"

  def self.scrape
    page = Nokogiri::HTML(URI.open(URL))

    # Simuler une requête comme un navigateur
  # doc = Nokogiri::HTML(URI.open(URL, "User-Agent" => "Mozilla/5.0"))

    crypto_names = page.xpath(' //*[@id="__next"]/div[2]/div[1]/div[2]/div/div[1]/div[5]/div/table/thead/tr/th[3]').map(&:text)
    crypto_prices = page.xpath('//*[@id="__next"]/div[2]/div[1]/div[2]/div/div[1]/div[5]/div/table/thead/tr/th[4]/div/div/p').map(&:text)

    result = crypto_names.zip(crypto_prices).map { |name, price| { name => price.gsub("$", "").to_f } }
    puts CryptoScraper.scrape.inspect
    puts " Cryptos récupérées : #{result.size} cryptos trouvées"
    result

  end
end

# pour 1 crypto trouver //*[@id="__next"]/div[2]/div[1]/div[2]/div/div[1]/div[5]/div/table/thead/tr/th[4]