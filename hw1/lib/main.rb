# frozen_string_literal: true

require './lib/report'
require './lib/report_presenter'

# Main class for HW1 Kuzmenkov Arseniy
class Main
  def initialize
    @depth = ENV['depth'].to_i

    set_data
    set_lists
    set_report
    present
  end

  def set_data
    @volumes_data = Parser.new(ENV['volumes_path'], %i[Vm_id Hdd_type Hdd_capacity]).pull_hash
    @vms_data = Parser.new(ENV['vms_path'], %i[Id Cpu Ram Hdd_type Hdd_capacity]).pull_hash
    @prices_data = Parser.new(ENV['prices_path'], %i[Type Price]).pull_hash
  end

  def set_lists
    @vm_list = VMSDataHandler.new(@vms_data).create_vm_list
    @volume_list = VolumesDataHandler.new(@volumes_data).create_volume_list
    @price_list = PricesDataHandler.new(@prices_data).create_price_list
  end

  def set_report
    @report = Report.new(@vm_list, @volume_list, @price_list)
  end

  def present
    ReportPresenter.present(@report.expensive(@depth), 'Самые дорогие')
    ReportPresenter.present(@report.cheap(@depth), 'Самые дешевые')
    ReportPresenter.present(@report.most_capacity_of_type(@depth, 'cpu'), 'Самые обьемные')
    ReportPresenter.present(@report.e_volume_amount(@depth, 'ssd'), 'Самое большое кол-во доп. дисков')
    ReportPresenter.present(@report.e_volume_volume(@depth, 'sata'), 'Самый большой обьем доп. дисков')
  end
end

Main.new
