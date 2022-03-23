require './vms_parser.rb'
require './vm.rb'

class VMS_Data_Handler

    @@vm_list = []

    def self.get_vm_list
        @@vm_list
    end

    # Создает массив обьектов класса vm для каждой машины по которой есть данные
    def self.create_vm_list
        @@vm_list = []
        VMS_Parser.pull_vms_arr.map {|row| @@vm_list.append(VM.new(*row))}
    end

end