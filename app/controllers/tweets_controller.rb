require 'multi_json'

class TweetsController < ApplicationController

  def index
    user_service    = UserService.new(current_user)
    twitter_service = TwitterService.new
    favs = user_service.update_favorites(MultiJson.load(params[:favorited]), 
                                         MultiJson.load(params[:unfavorited]))
    tweets = twitter_service.get_tweets(favs.map(&:user_name))
    render :json => tweets.flatten.to_json
  end

end
