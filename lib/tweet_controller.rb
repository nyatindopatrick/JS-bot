require 'twitter'
require 'dotenv'
Dotenv.load

class Tweet
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['CONSUMER_KEY']
      config.consumer_secret = ENV['CONSUMER_SECRET']
      config.access_token = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end
    @twits = []
  end

  def fetch_tweets
    @twits = @client.search('#javascript', result_type: 'recent').take(2)
  end

  def like_tweets
    @client.favorite(@twits)
  end

  def retweets
    @twits.each do |t|
      @client.retweet(t.id)
    end
  end
end
