require 'multi_json'

class TweetController < ApplicationController

  def user_timeline
    tw_service = TwitterService.new
    
    users = MultiJson.load(params[:users])
    unfavorited = MultiJson.load(params[:unfavorited])
    
    tweets = tw_service.get_tweets_for_users(users, unfavorited, current_user)

    render :json => tweets.flatten.to_json
  end
  
end