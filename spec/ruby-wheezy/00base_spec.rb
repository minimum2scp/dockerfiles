require 'spec_helper'

Dir["#{__dir__}/../baseimage-wheezy/*_spec.rb"].sort.each do |spec|
  load spec
end

