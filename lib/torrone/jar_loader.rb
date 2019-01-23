require 'pry'

module Torrone
  class JARLoader
    def self.load
      return if Rjb::loaded?
      #RJM Loading
      jars = Dir.glob("#{Config.jar_dir}/*.jar").join(':')
      #print jars
      Rjb::load(jars)
    end
  end
end