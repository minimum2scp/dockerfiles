if ENV['RUBY_GC_PROFILER_ENABLED'] =~ /\A(true|yes|on|1)\z/
  GC::Profiler.enable
end

if ENV['RACK_MINI_PROFILER_ENABLED'] =~ /\A(true|yes|on|1)\z/
  require 'rack-mini-profiler'
  use ::Rack::MiniProfiler
  ::Rack::MiniProfiler.config.pre_authorize_cb = ->(env){
    r = [200, {'Content-Type' => 'text/plain'}, ['dummy']]
    a = ->(e){r}
    TDiary::Rack::Auth.new(a).call(env) == r
  }
end

$:.unshift( File.join(File::expand_path(File::dirname( __FILE__ )), 'lib' ).untaint )
require 'tdiary/application'

use ::Rack::Reloader unless ENV['RACK_ENV'] == 'production'
run TDiary::Application.new

