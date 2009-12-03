require 'rake'
require 'rake/gempackagetask'
require 'rubygems'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name          = "rack-environmental"
    s.version       = "1.0.3"
    s.add_dependency 'plastic', '>= 0.0.0'
    s.author        = "Wyatt Greene"
    s.email         = "techiferous@gmail.com"
    s.summary       = "Rack middleware that adds an indicator of your application environment"
    s.description   = %Q{
      Rack::Environmental indicates which environment your web application is running
      in (staging, test, etc.).
    }
    s.require_path  = "lib"
    s.files         = ["lib/rack-environmental.rb", "LICENSE", "Rakefile", "README.rdoc",
                       "CHANGELOG"]
    s.homepage      = "http://github.com/techiferous/rack-environmental"
    s.requirements  << "none"
    s.has_rdoc      = false
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end
