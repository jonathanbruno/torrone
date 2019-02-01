module Torrone
  module Exporters
    class Xls < Base
      def export(jasper_print)
        super(jasper_print) do |exporter, configuration|
          #configuration.setOnePagePerSheet(true);
          configuration.setDetectCellType(true);//Set configuration as you like it!!
          configuration.setCollapseRowSpan(false);
        end
      end

      protected

      def exporter_class
        Rjb::import 'net.sf.jasperreports.engine.export.JRXlsExporter'
      end

      def report_configuration_class
        Rjb::import 'net.sf.jasperreports.export.SimpleXlsReportConfiguration'
      end
    end
  end
end