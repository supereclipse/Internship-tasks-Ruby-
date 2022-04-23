# frozen_string_literal: true

# ExtraVolume class
class ExtraVolume
  attr_reader :vm_id, :volume_hashes

  def initialize(vm_id, volume_hashes)
    @vm_id = vm_id
    @volume_hashes = volume_hashes
  end

  # Считает кол-во дисков опр типа
  def get_amount_of_type(type)
    @volume_hashes.sum { |row| type == 'All' || type == row[:Hdd_type] ? 1 : 0 }
  end

  # Считает обьем дисков опр типа
  def get_volume_of_type(type)
    @volume_hashes.sum { |row| type == 'All' || type == row[:Hdd_type] ? row[:Hdd_capacity].to_i : 0 }
  end
end
