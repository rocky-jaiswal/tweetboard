require 'multi_json'

class TweetController < ApplicationController

  def user_timeline
    tw_service = TwitterService.new
    tweets = []
    users = MultiJson.load(params[:users])
    users.each do |user|
      tweets << tw_service.get_last_three_tweets(user)
    end
    render :json => tweets.flatten.to_json
  end
  
end