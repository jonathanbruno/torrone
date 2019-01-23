require "torrone/version"
require "rjb"

module Torrone
  autoload :Compiler, 'torrone/compiler'
  autoload :Report, 'torrone/report'
  autoload :JARLoader, 'torrone/jar_loader'
  autoload :Config, 'torrone/config'
  autoload :JsonInputStream, 'torrone/json_input_stream'
end
