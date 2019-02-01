module Torrone
  module Exporters
    class Csv < Base
      def export(jasper_print)
        super(jasper_print) do |exporter, configuration|
          #configuration.setOnePagePerSheet(true);
        end
      end

      protected

      def exporter_class
        Rjb::import 'net.sf.jasperreports.engine.export.JRCsvExporter'
      end

      def report_configuration_class
        Rjb::import 'net.sf.jasperreports.export.SimpleCsvReportConfiguration'
      end
    end
  end
end