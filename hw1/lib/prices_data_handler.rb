# frozen_string_literal: true

require './lib/parser'
require './lib/pricelist'

# Обрабатывает данные по price
class PricesDataHandler
  def initialize(prices_data)
    @prices_data = prices_data
  end

  def create_price_list
    PriceList.new(@prices_data)
  end
end
