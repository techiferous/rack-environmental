require File.join(File.dirname(__FILE__), 'app')
require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'rack-environmental')

use Rack::Environmental, :development => { :url => /^localhost.+$/ }

run App.new
