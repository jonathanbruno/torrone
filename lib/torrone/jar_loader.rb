module Torrone
  class JARLoader
    def self.load
      return if Rjb::loaded?
      #RJM Loading
      jars = Dir["#{Config.jar_dir}/*.jar"].join(':')

      Rjb::load(jars)
    end
  end
end