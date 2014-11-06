require "rubygems"
require "geminabox"

Geminabox.data = "/home/debian/geminabox/data"
#Geminabox.build_legacy = false
#Geminabox.rubygems_proxy = true
#Geminabox.allow_remote_failure = true

run Geminabox::Server
