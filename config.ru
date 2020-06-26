# frozen_string_literal: true

require './app/controllers/home.rb'
require './app/controllers/tweets'

run Rack::URLMap.new({
                       '/' => Home,
                       '/tweets' => TweetsController
                     })
