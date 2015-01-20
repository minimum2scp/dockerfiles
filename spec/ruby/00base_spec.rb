require 'spec_helper'

Dir["#{__dir__}/../baseimage/*_spec.rb"].sort.each do |spec|
  load spec
end

