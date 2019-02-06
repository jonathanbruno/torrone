module Torrone
  class ParamHashCreator
    def initialize(ruby_params = {})
      @ruby_params = ruby_params
    end

    def add(key, value)
      @ruby_params[key] = value
    end

    def params_hash
      _JRParameter = Rjb::import 'net.sf.jasperreports.engine.JRParameter'
      _JsonQueryExecuterFactory = Rjb::import 'net.sf.jasperreports.engine.query.JsonQueryExecuterFactory'  
      _Locale = Rjb::import 'java.util.Locale'
      _HashMap = Rjb::import 'java.util.HashMap'
      
      _HashMap.new.tap do |parameters|
        parameters.put(_JsonQueryExecuterFactory.JSON_DATE_PATTERN, "yyyy-MM-dd");
        parameters.put(_JsonQueryExecuterFactory.JSON_NUMBER_PATTERN, "#,##0.##");
        parameters.put(_JsonQueryExecuterFactory.JSON_LOCALE, _Locale.ENGLISH);
        parameters.put(_JRParameter.REPORT_LOCALE, _Locale.US);
        ruby_params.each do |key, value|
          parameters.put(key, value)
        end
      end
    end

    private

    attr_accessor :ruby_params
  end
end