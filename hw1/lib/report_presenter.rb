# frozen_string_literal: true

require './lib/report'

# Класс вывода отчетов
class ReportPresenter
  def self.present(report, type = 'Undefined report')
    puts type
    report.each { |line| puts "VM_ID: #{line[0]} Result: #{line[1]}" }
  end
end
