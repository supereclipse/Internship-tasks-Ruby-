require 'csv'


class Volumes_Parser

    # Возвращает массив хешей
    def self.pull_volumes_hash
        self.convert_to_hash
    end    
    
    # Возвращает массив строк
    def self.pull_volumes_arr
        self.read_volumes
    end

    private
    
    def self.read_volumes
        @volumes_arr = CSV.read("./csv_data/volumes.csv")
    end

    def self.convert_to_hash
        keys = [:Vm_id, :Hdd_type, :Hdd_capacity]
        read_volumes.collect { |a| Hash[ [keys, a].transpose] }
    end

end