# frozen_string_literal: true

require './lib/parser'
require './lib/vm'

# Обрабатывает данные по vm
class VMSDataHandler
  def initialize(vms_data)
    @vms_data = vms_data
  end

  # Создает массив обьектов класса vm для каждой машины по которой есть данные
  def create_vm_list
    @vms_data.map { |row| VM.new(*row.values) }
  end
end
