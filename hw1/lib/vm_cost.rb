# frozen_string_literal: true

require './lib/vm'
require './lib/prices_data_handler'
require './lib/volumes_data_handler'

# Класс для подсчета стоимости vm и доп.дисков
class VMCost
  def initialize(vm, price, vm_volume)
    @vm = vm
    @price = price
    @vm_volume = vm_volume
  end

  def cost_full
    cost_without_extra_volume + cost_of_extra_volume
  end

  def cost_without_extra_volume
    cpu_price = @price.get_price_by_type('cpu') * @vm.cpu.to_i
    ram_price = @price.get_price_by_type('ram') * @vm.ram.to_i
    mem_price = @price.get_price_by_type(@vm.hdd_type) * @vm.hdd_capacity.to_i

    cpu_price + ram_price + mem_price
  end

  def cost_of_extra_volume
    @vm_volume ? @vm_volume.volume_hashes.sum { |row| @price.get_price_by_type(row[:Hdd_type]) * row[:Hdd_capacity].to_i} : 0
  end
end
