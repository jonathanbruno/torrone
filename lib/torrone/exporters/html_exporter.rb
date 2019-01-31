module Torrone
  module Exporters
    class HtmlExporter < BaseExporter
      def export(jasper_print)
        super(jasper_print) do |exporter, configuration|
          #configuration.setOnePagePerSheet(true);
        end
      end

      protected

      def exporter_class
        Rjb::import 'net.sf.jasperreports.engine.export.HtmlExporter'
      end

      def report_configuration_class
        Rjb::import 'net.sf.jasperreports.export.SimpleHtmlReportConfiguration'
      end

      def output_stream_exporter_class 
        Rjb::import 'net.sf.jasperreports.export.SimpleHtmlExporterOutput'
      end
    end
  end
end