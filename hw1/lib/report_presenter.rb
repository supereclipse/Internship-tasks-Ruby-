# frozen_string_literal: true

require './lib/report'

# Класс вывода отчетов
class ReportPresenter
  def self.present(report)
    report.map { |x| puts "VM_ID: #{x[0]} Result: #{x[1]}" }
  end
end
