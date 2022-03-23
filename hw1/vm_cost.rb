require './vm.rb'
require './prices_data_handler'
require './volumes_data_handler'


class VMCost

    def self.cost_full(vm)
        self.cost_without_extra_volume(vm) + self.cost_of_extra_volume(vm)
    end

    def self.cost_without_extra_volume(vm)

        price = PricesDataHandler.create_price_list
        cpu_price = price.get_price_by_type('cpu') * vm.cpu.to_i 
        ram_price = price.get_price_by_type('ram') * vm.ram.to_i 
        mem_price = price.get_price_by_type(vm.hdd_type) * vm.hdd_capacity.to_i 

        cpu_price + ram_price + mem_price
    end

    def self.cost_of_extra_volume(vm)

        cost = 0
        price = PricesDataHandler.create_price_list
        Volumes_Data_Handler.get_all_volume_by_vm_id(vm.id).map {|row| cost += price.get_price_by_type(row[:Hdd_type]) * row[:Hdd_capacity].to_i}
        cost

    end

end