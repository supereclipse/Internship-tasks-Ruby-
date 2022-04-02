# frozen_string_literal: true

require './lib/parser'
require './lib/pricelist'

# Обрабатывает данные по price
class PricesDataHandler
  def self.create_price_list
    prices_parser = Parser.new('./data/csv_data/prices.csv', %i[Type Price])
    PriceList.new(prices_parser.pull_hash.map)
  end
end
