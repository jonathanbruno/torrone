# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'torrone/version'

Gem::Specification.new do |gem|
  gem.name          = "torrone"
  gem.date          = %q{2019-01-19}
  #gem.executables   << 'torrone'
  gem.version       = Torrone::VERSION
  gem.authors       = ["Jonathan Bruno"]
  gem.email         = ["jonathanbruno.ueg@gmail.com"]
  gem.description   = 'Ruby client to JasperReports.'
  gem.summary       = "Ruby client to JasperReports API.\nCurrently, only does compilation of JRXML files and generation of PDF reports."
  gem.homepage      = "https://github.com/jonathanbruno/torrone"
  gem.licenses      = ['MIT']

  gem.files         = Dir.glob('lib/**/*.rb') +
                      %w(README.rst LICENSE Gemfile CHANGELOG)
  gem.require_paths = ["lib"]

  gem.add_dependency 'builder', '3.2.3'
  gem.add_dependency 'activesupport', '5.2.2'
  gem.add_dependency 'rake', '12.3.2'
  gem.add_dependency 'rjb', '1.5.8'
end