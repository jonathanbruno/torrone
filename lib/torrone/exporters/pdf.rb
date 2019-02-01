module Torrone
  module Exporters
    class Pdf < Base
      def export(jasper_print)
        super(jasper_print) do |exporter, configuration|
          #configuration.setOnePagePerSheet(true);
        end
      end

      protected

      def exporter_class
        Rjb::import 'net.sf.jasperreports.engine.export.JRPdfExporter'
      end

      def report_configuration_class
        Rjb::import 'net.sf.jasperreports.export.SimplePdfReportConfiguration'
      end
    end
  end
end