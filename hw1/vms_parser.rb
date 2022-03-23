require 'csv'

 
class VMS_Parser

    # Возвращает массив хешей
    def self.pull_vms_hash
        self.convert_to_hash
    end    
    
    # Возвращает массив строк
    def self.pull_vms_arr
        self.read_vms
    end

    private
    
    def self.read_vms
        @vms_arr = CSV.read("./csv_data/vms.csv")
    end

    def self.convert_to_hash
        keys = [:Id, :Cpu, :Ram, :Hdd_type, :Hdd_capacity]
        read_vms.collect { |a| Hash[ [keys, a].transpose] }
    end

end