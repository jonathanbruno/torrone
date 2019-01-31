module Torrone
  class ExportManager
    class << self
      VALID_FORMATS = %i[pdf xml csv html].freeze
      def export(jasper_print, format = :pdf)
        raise 'Invalid Format' unless VALID_FORMATS.include?(format)

        klass = "Torrone::Exporters::#{format.to_s.capitalize}Exporter".constantize
        klass.new.export(jasper_print)
      end
    end
  end
end
