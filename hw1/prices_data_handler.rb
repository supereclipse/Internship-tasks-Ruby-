require './prices_parser.rb'
require './price.rb'

class PricesDataHandler

    def self.create_price_list
        Price.new(Prices_Parser.pull_prices_hash.map)
    end

end
