require 'lib/app'
require 'rack/bug/panels/mustache_panel'
use Rack::Bug::MustachePanel
run MyApp
