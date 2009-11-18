require 'rake'
require 'rake/gempackagetask'
require 'rubygems'
 
gem_spec = Gem::Specification.new do |s|
  s.name          = "rack-environmental"
  s.version       = "1.0.2"
  s.add_dependency 'rack', '>= 1.0.0'
  s.add_dependency 'nokogiri', '>= 1.4.0'
  s.author        = "Wyatt Greene"
  s.email         = "techiferous@gmail.com"
  s.summary       = "Rack middleware that adds an indicator of your application environment"
  s.description   = %Q{
    Rack::Environmental indicates which environment your web application is running
    in (staging, test, etc.).
  }
  s.require_path  = "lib"
  s.files         = ["lib/rack-environmental.rb", "LICENSE", "Rakefile", "README",
                     "CHANGELOG"]
  s.homepage      = "http://github.com/techiferous/rack-environmental"
  s.requirements  << "none"
  s.has_rdoc      = false
end

Rake::GemPackageTask.new(gem_spec) do |pkg| 
end
