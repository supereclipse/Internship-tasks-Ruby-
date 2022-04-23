# frozen_string_literal: true

require './lib/vms_data_handler'
require './lib/vm_cost'

# Составляет отчеты в виде массивов [id,значение]
class Report
  def initialize(vm_list, volume_list, price_list)
    @vm_list = vm_list
    @volume_list = volume_list
    @price_list = price_list
  end

  def expensive(n)
    cheap(n).reverse
  end

  def cheap(n)
    @vm_list.map { |vm| [vm.id, VMCost.new(vm, @price_list, @volume_list.find { |vol| vol.vm_id == vm.id }).cost_full] }.sort_by { |_id, value| value }.first(n)
  end

  # Выводит n ВМ с наибольшим обьемом указанного параметра (cpu,ram,hdd_capacity)
  def most_capacity_of_type(n, type)
    @vm_list.map { |vm| [vm.id, vm.send(type.to_sym).to_i] }.sort_by { |_id, value| value }.last(n).reverse
  end

  # Выводит n ВМ с наибольшим количеством дисков опр. типа
  def e_volume_amount(n, type = 'All')
    @volume_list.map { |extra| [extra.vm_id, extra.get_amount_of_type(type)] }.sort_by { |_id, value| value }.last(n).reverse
  end

  # Выводит n ВМ с наибольшим обьемом дисков опр. типа
  def e_volume_volume(n, type = 'All')
    @volume_list.map { |extra| [extra.vm_id, extra.get_volume_of_type(type)] }.sort_by { |_id, value| value }.last(n).reverse
  end

end
