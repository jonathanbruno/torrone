require 'pry'
require 'active_support'
require 'active_support/core_ext'

module Torrone
  class Report

    class << self
      def generate(report_name, options = {})
        datastream = JsonInputStreamCreator.to_stream(options[:data])
        jasperPrint = RunManager.fill_report(report_name, datastream, options[:params])
        ExportManager.export(jasperPrint, options[:format])
      end
    end
  end
end
