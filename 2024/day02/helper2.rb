require_relative "helper"
require "colorize"

# Problem Dampener
def problem_dampener(report)
  # puts @report.to_s.yellow
  @test_report = @report.dup

  # @new_document = []
  @candidate = ""

  @report.length.times.with_index do |index|
    @test_report.delete_at(index)

    if isReportsafe?(@test_report)
      # puts @test_report.to_s.green
      @new_document << @test_report
      break
    else
      # puts @test_report.to_s.red
    end

    @test_report = @report.dup
  end

  @new_document
end
