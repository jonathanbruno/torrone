module Torrone
  module Exporters 
    class BaseExporter
      def export(jasper_print)
        _DefaultJasperReportsContext = Rjb::import 'net.sf.jasperreports.engine.DefaultJasperReportsContext'
        _SimpleExporterInput = Rjb::import 'net.sf.jasperreports.export.SimpleExporterInput'
        _ByteArrayOutputStream = Rjb::import 'java.io.ByteArrayOutputStream'
        _SimpleOutputStreamExporterOutput = output_stream_exporter_class
        exporter = exporter_class.new(_DefaultJasperReportsContext.getInstance());
        exporter.setExporterInput(_SimpleExporterInput.new(jasper_print));
        outputstream = _ByteArrayOutputStream.new
        exporter.setExporterOutput(_SimpleOutputStreamExporterOutput.new(outputstream));
        configuration = report_configuration_class.new;

        yield(exporter,configuration) if block_given?
        
        exporter.exportReport();
        
        output = outputstream.toByteArray()
        outputstream.flush()
        outputstream.close()
        output
      end

      protected

      def output_stream_exporter_class 
        Rjb::import 'net.sf.jasperreports.export.SimpleOutputStreamExporterOutput'
      end

      def exporter_class
        raise 'Not implemented error'
      end

      def report_configuration_class
        raise 'Not implemented error'
      end
    end
  end
end