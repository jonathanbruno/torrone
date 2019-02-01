require 'pry'
require 'active_support'
require 'active_support/core_ext'

module Torrone
  class Report

    class << self
      def generate(report_name, options = {}, params = {})
        data = options[:data] if options
        _JRParameter = Rjb::import 'net.sf.jasperreports.engine.JRParameter'
        _JsonQLQueryExecuterFactory = Rjb::import 'net.sf.jasperreports.engine.query.JsonQLQueryExecuterFactory'
        _JsonQueryExecuterFactory = Rjb::import 'net.sf.jasperreports.engine.query.JsonQueryExecuterFactory'
        _JasperFillManager = Rjb::import 'net.sf.jasperreports.engine.JasperFillManager'
        _Locale = Rjb::import 'java.util.Locale'
        _HashMap = Rjb::import 'java.util.HashMap'

        namespace, report_name = extract_namespace(report_name)
        report_path = File.join(Config.jasper_dir || '.', namespace, report_name)
        jrxml_file = "#{report_path}.jrxml"

        jasper_file = Compiler.compile(jrxml_file);
        
        datastream = JsonInputStream.to_stream(data)

			  parameters = _HashMap.new;
			  parameters.put(_JsonQueryExecuterFactory.JSON_DATE_PATTERN, "yyyy-MM-dd");
			  parameters.put(_JsonQueryExecuterFactory.JSON_NUMBER_PATTERN, "#,##0.##");
			  parameters.put(_JsonQueryExecuterFactory.JSON_LOCALE, _Locale.ENGLISH);
        parameters.put(_JRParameter.REPORT_LOCALE, _Locale.US);
			  parameters.put(_JsonQLQueryExecuterFactory.JSON_INPUT_STREAM, datastream) 
        
        jasperPrint = _JasperFillManager.fillReport(jasper_file, parameters);
        ExportManager.export(jasperPrint, options[:format])

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
