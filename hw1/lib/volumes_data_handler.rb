# frozen_string_literal: true

require './lib/parser'
require './lib/extra_volume'

# Обрабатывает данные по доп. дискам
class VolumesDataHandler
  def initialize(volume_data)
    @volume_data = volume_data
  end

  # Возвращает список всех доп. жестких дисков для конкретного id ВM
  def get_all_volume_by_vm_id(vm_id)
    @volume_data.group_by { |row| row[:Vm_id] }[vm_id].to_a
  end

  # Создает массив обьектов класса ExtraVolume для каждого уникального id ВМ и соотв-го ему списка доп. жестких дисков
  def create_volume_list
    # Для каждой уникальной пары key-value(vm_id: 12) из массива хешей volumes создаю обьект класса ExtraVolume
    @volume_data.map(&:first).uniq.map { |key_val| ExtraVolume.new(key_val[1], get_all_volume_by_vm_id(key_val[1])) }
  end
end
