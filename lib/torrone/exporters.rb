module Torrone
  module Exporters
    autoload :BaseExporter, 'torrone/exporters/base_exporter'
    autoload :PdfExporter, 'torrone/exporters/pdf_exporter'
    autoload :XlsExporter, 'torrone/exporters/xls_exporter'
    autoload :CsvExporter, 'torrone/exporters/csv_exporter'
    autoload :HtmlExporter, 'torrone/exporters/html_exporter'
  end
end
