module Torrone
  class ExportManager
    class << self
      def export(jasper_print)
        _JasperExportManager = Rjb::import 'net.sf.jasperreports.engine.JasperExportManager'
        _JasperExportManager._invoke(
          'exportReportToPdf',
          'Lnet.sf.jasperreports.engine.JasperPrint;',
          jasper_print
        )
      end
    end
  end
end
