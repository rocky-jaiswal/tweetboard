require 'multi_json'

class TweetController < ApplicationController

  def user_timeline
    tw_service = TwitterService.new(current_user)
    users = MultiJson.load(params[:users])
    unfavorited = MultiJson.load(params[:unfavorited])
    tweets = tw_service.get_tweets_for_users(users, unfavorited)

    render :json => tweets.flatten.to_json
  end
  
end