require './vms_data_handler.rb'
require './vm_cost.rb'

class Report

    def self.expensive(n)
        @expensive_list = []
        
        VMS_Data_Handler.create_vm_list
        VMS_Data_Handler.get_vm_list.each {|vm| @expensive_list.append([vm.id, VMCost.cost_full(vm)])}

        @expensive_list.sort_by {|id, value| value}
                .last(n)
                .reverse  

    end

    def self.cheap(n)
        @cheap_list = []
        
        VMS_Data_Handler.create_vm_list
        VMS_Data_Handler.get_vm_list.each {|vm| @cheap_list.append([vm.id, VMCost.cost_full(vm)])}

        @cheap_list.sort_by {|id, value| value}
                .first(n)     

    end

    # Выводит n ВМ с наибольшим обьемом указанного параметра (cpu,ram,hdd_capacity)
    def self.most_capacity_of_type (n,type)
        @capacity_list = []

        VMS_Data_Handler.create_vm_list
        VMS_Data_Handler.get_vm_list.each {|vm| @capacity_list.append([vm.id, vm.send(type.to_sym).to_i])} # Подставляю аргумент type в название метода с помощью send

        @capacity_list.sort_by {|id, value| value}
            .last(n)   
            .reverse

    end

    # Выводит n ВМ с наибольшим количеством дисков опр. типа
    def self.e_volume_amount(n, type = "All")
        @e_vol_amount_list = []

        Volumes_Data_Handler.create_volume_list
        # Проходит по массиву обьектов класса ExtraVolume и записывает id и кол-во в @e_vol_amount_list
        Volumes_Data_Handler.get_volume_list.each {|extra| @e_vol_amount_list.append([extra.vm_id, extra.get_amount_of_type(type)]) }

        @e_vol_amount_list.sort_by {|id, amount| amount}
                .last(n)
                .reverse
    end

    # Выводит n ВМ с наибольшим обьемом дисков опр. типа
    def self.e_volume_volume(n, type = "All")
        @e_vol_vol_list = []

        Volumes_Data_Handler.create_volume_list
        Volumes_Data_Handler.get_volume_list.each {|extra| @e_vol_vol_list.append([extra.vm_id, extra.get_volume_of_type(type)]) }

        @e_vol_vol_list.sort_by {|id, amount| amount}
                .last(n)
                .reverse
    end

end