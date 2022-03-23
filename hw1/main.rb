require './Report.rb'
require "./Report_presenter.rb"

puts "Самые дорогие"
ReportPresenter.present(Report.expensive(3))
puts "Самые дешевые"
ReportPresenter.present(Report.cheap(3))
puts "Самые обьемные"
ReportPresenter.present(Report.most_capacity_of_type(3, "cpu"))
puts "Самое большое кол-во доп. дисков"
ReportPresenter.present(Report.e_volume_amount(3, "ssd"))
puts "Самый большой обьем доп. дисков"
ReportPresenter.present(Report.e_volume_volume(3, "sata"))
