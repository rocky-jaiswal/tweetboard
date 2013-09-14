require 'multi_json'

class TweetController < ApplicationController

  def user_timeline
    tw_service = TwitterService.new
    tweets = []
    users = MultiJson.load(params[:users])
    users.each do |user|
      tweets << cleanup_tweets(tw_service.get_last_three_tweets(user))
    end
    render :json => tweets.flatten.to_json
  end

  private

  def cleanup_tweets(tws)
    tweets = []
    tws.map do |tw| 
      tweets << {text: tw.text, profile_image_url: tw.user.profile_image_url.to_s, user_name: tw.user.name, screen_name: tw.user.screen_name}
    end
    tweets
  end

  
end