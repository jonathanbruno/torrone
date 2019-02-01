require "torrone/version"
require "rjb"

module Torrone
  autoload :Compiler, 'torrone/compiler'
  autoload :Report, 'torrone/report'
  autoload :JARLoader, 'torrone/jar_loader'
  autoload :Config, 'torrone/config'
  autoload :JsonInputStreamCreator, 'torrone/json_input_stream_creator'
  autoload :ExportManager, 'torrone/export_manager'
  autoload :ParamHashCreator, 'torrone/param_hash_creator'
  autoload :RunManager, 'torrone/run_manager'

  module Exporters
    autoload :Base, 'torrone/exporters/base'
    autoload :Pdf, 'torrone/exporters/pdf'
    autoload :Xls, 'torrone/exporters/xls'
    autoload :Csv, 'torrone/exporters/csv'
    autoload :Html, 'torrone/exporters/html'
  end
end
