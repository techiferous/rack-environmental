require 'rake'
require 'rake/gempackagetask'
require 'rubygems'
 
gem_spec = Gem::Specification.new do |s|
  s.name          = "environmental"
  s.version       = "0.0.1"
  s.author        = "Wyatt Greene"
  s.email         = "techiferous@gmail.com"
  s.summary       = "Rack middleware that adds an indicator of your application environment"
  s.description   = %Q{
    Rack::Environmental indicates which environment your web application is running
    in (staging, test, etc.).
  }
  s.require_path  = "lib"
  s.files         = ["lib/environmental.rb", "LICENSE", "Rakefile", "README",
                     "CHANGELOG"]
  s.homepage      = "http://github.com/techiferous/environmental"
  s.requirements  << "none"
  s.has_rdoc      = false
end

Rake::GemPackageTask.new(gem_spec) do |pkg| 
end
