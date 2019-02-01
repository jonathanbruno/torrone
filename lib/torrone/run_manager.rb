module Torrone
  class RunManager
    class << self
      def fill_report(report_name, datastream)
        _JsonQLQueryExecuterFactory = Rjb::import 'net.sf.jasperreports.engine.query.JsonQLQueryExecuterFactory'

        namespace, report_name = extract_namespace(report_name)
        report_path = File.join(Config.jasper_dir || '.', namespace, report_name)
        jrxml_file = "#{report_path}.jrxml"

        jasper_file = Compiler.compile(jrxml_file);
        _JasperFillManager = Rjb::import 'net.sf.jasperreports.engine.JasperFillManager'

        params_creator = ParamHashCreator.new
        params_creator.add(_JsonQLQueryExecuterFactory.JSON_INPUT_STREAM, datastream)
        jasperPrint = _JasperFillManager.fillReport(jasper_file, params_creator.params_hash);
      end

      private

      def extract_namespace(name)
        parts = name.split('/')
        jasper_name = parts.pop
        namespace = parts.join('/')
        [namespace, jasper_name]
      end
    end
  end
end