require 'pry'
module Torrone
  class ExportManager
    class << self

      def export(jasper_print, format = :pdf)
        format ||= :pdf
        _JasperExportManager = Rjb::import 'net.sf.jasperreports.engine.JasperExportManager'
        _JasperExportManager._invoke(
          "exportReportTo#{format.to_s.capitalize}",
          'Lnet.sf.jasperreports.engine.JasperPrint;',
          jasper_print
        )
      end
    end
  end
end
