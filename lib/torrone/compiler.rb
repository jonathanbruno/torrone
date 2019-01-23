module Torrone
  class Compiler
    def self.compile(jrxml_file, output_dir = nil)
      output_dir ||= File.dirname(jrxml_file)
      output_file = File.join(output_dir, File.basename(jrxml_file, '.jrxml') + '.jasper')
      _JasperCompileManager = Rjb::import 'net.sf.jasperreports.engine.JasperCompileManager'
      _JasperCompileManager.compileReportToFile(jrxml_file, output_file);
      output_file
    end
  end
end