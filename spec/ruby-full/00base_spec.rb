require 'spec_helper'

Dir["#{__dir__}/../ruby/*_spec.rb"].sort.each do |spec|
  load spec
end

