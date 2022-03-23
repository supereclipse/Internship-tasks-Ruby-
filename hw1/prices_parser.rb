require 'csv'

 
class Prices_Parser

    # Возвращает массив хешей
    def self.pull_prices_hash
        self.convert_to_hash
    end    
    
    # Возвращает массив строк
    def self.pull_prices_arr
        self.read_prices
    end

    private

    def self.read_prices
        @prices_arr = CSV.read("./csv_data/prices.csv")
    end

    def self.convert_to_hash
        keys = [:Type, :Price]
        read_prices.collect { |a| Hash[ [keys, a].transpose] }
    end

end