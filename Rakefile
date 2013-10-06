require 'rake'
require 'rubygems'
require 'rubygems/package_task'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name          = "rack-environmental"
    s.version       = "1.3.1"
    s.add_dependency 'rack-plastic', '>= 0.1.1'
    s.author        = "Wyatt Greene"
    s.email         = "techiferous@gmail.com"
    s.summary       = "Rack middleware that adds an indicator of your application environment"
    s.description   = %Q{
      Rack::Environmental indicates which environment your web application is running
      in (staging, test, etc.).
    }
    s.require_path  = "lib"
    s.files         = []
    s.files         << "README.rdoc"
    s.files         << "LICENSE"
    s.files         << "CHANGELOG"
    s.files         << "Rakefile"
    s.files         += Dir.glob("lib/**/*")
    s.files         += Dir.glob("test/**/*")
    s.homepage      = "http://github.com/techiferous/rack-environmental"
    s.requirements  << "none"
    s.has_rdoc      = false
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end
