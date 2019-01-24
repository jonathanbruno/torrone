module Torrone
  class ExportManager
    class << self
      def export(jasper_print)
        _JasperExportManager = Rjb::import 'net.sf.jasperreports.engine.JasperExportManager'
        _JasperExportManager._invoke(
          'exportReportToPdfFile',
          'Lnet.sf.jasperreports.engine.JasperPrint;Ljava.lang.String;',
          jasper_print,
          "reports/users.pdf"
        )
      end
    end
  end
end
