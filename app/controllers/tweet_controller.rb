require 'multi_json'

class TweetController < ApplicationController

  def user_timeline
    tweets = []
    tw_service = TwitterService.new
    
    users = MultiJson.load(params[:users])
    unfavorited = MultiJson.load(params[:unfavorited])
    
    users = users - unfavorited
    current_user.delete_favorites(unfavorited) if current_user
    users = current_user.add_favorites(users) if current_user

    users.each do |user|
      tweets << tw_service.get_last_three_tweets(user)
    end

    render :json => tweets.flatten.to_json
  end
  
end