# frozen_string_literal: true

require 'sinatra/base'

class Home < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, proc { File.join(root, 'views') }

  get '/' do
    erb :home
  end
end
