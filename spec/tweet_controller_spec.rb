require 'rspec'
require_relative '../lib/tweet_controller.rb'

RSpec.describe Tweet do
  let(:twiter) { Tweet.new }
  describe '#fetch_tweeets' do
    it 'should return an array of found tags' do
      expect(twiter.fetch_tweets.length).to be < 3
    end
  end

  describe '#like_tweets' do
    it 'should return an array of liked tweets' do
      expect(twiter.like_tweets).to be_a Array
    end
  end

  describe '#retweets' do
    it 'should return an array of retweets' do
      expect(twiter.retweets).to be_a Array
    end
  end
end
