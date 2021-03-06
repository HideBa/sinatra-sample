# frozen_string_literal: true

require_relative '../model/tweet'

require 'sinatra'
require 'sinatra/reloader'

class TweetsController < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, proc { File.join(root, 'views') }

  get '/' do
    get_tweets
    # erb :tweet
  end

  post '/new' do
    post_tweets
  end

  def get_tweets
    @tweets = 'hogehogefugafuga'
    records = Tweets.new
    tweets_list = records.get_tweets
    tweets_list.each do |tweet|
      p '----------', tweet['content']
    end
    p 'record ----------------', tweets_list
    erb :tweet
  end

  def post_tweets
    @content = params[:tweet]
    p '--------', @content
    records = Tweets.new
    records.post_tweet(@content)
    tweets_list = records.get_tweets
    tweets_list.each do |tweet|
      p '----------', tweet['content']
    end
    erb :tweet
  end
end
