# frozen_string_literal: true

require 'pg'

class Tweets
  def get_tweets
    settings = get_db_settings
    connection = PG.connect(settings)
    result = connection.exec('SELECT * FROM tweets;')
  rescue PG::Error => e
    puts e.message
  ensure
    connection&.close
    result && result
  end

  def post_tweet(content)
    settings = get_db_settings
    connection = PG.connect(settings)
    sql = 'INSERT INTO tweets VALUES (3, $1);'
    connection.exec(sql, [content])
  rescue PG::Error => e
    puts e.message
  ensure
    connection&.close
  end

  # connection.exec(
  #   'INSERT INTO tweets (content, user_id) VALUES ($1, $2);', ['hogehogehoge', 1]
  # )
  def self.find_all
    settings = get_db_settings
    connection = PG.connect(settings)
    result = connection.exec('SELECT * FROM tweets;')
  rescue PG::Error => e
    puts e.message
  ensure
    connection&.close
    result && result
  end

  private

  def get_db_settings
    settings = { host: 'localhost', user: 'sinatra_user', password: 'password', dbname: 'sinatra_db', port: '5432' }
    settings
  end
end
