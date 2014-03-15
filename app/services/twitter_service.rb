class TwitterService

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Figaro.env.tw_c_key
      config.consumer_secret     = Figaro.env.tw_c_secret
      config.access_token        = Figaro.env.tw_a_token
      config.access_token_secret = Figaro.env.tw_a_secret
    end
  end

  def get_tweets(handles)
    handles.map do |user|
      get_last_three_tweets(user)
    end
  end

  def get_last_three_tweets(user)
    begin
      tweets = @client.user_timeline(user, {count: 3})
      cleanup_tweets(tweets)
    rescue Exception => e
      Rails.logger.error "Error while retrieving tweets for " + user
      return dummy_tweets(user)
    end
  end

  def cleanup_tweets(tws)
    tweets = []
    tws.map do |tw|
      tweets << {text: tw.text, profile_image_url: tw.user.profile_image_url_https.to_s, user_name: tw.user.name, screen_name: tw.user.screen_name}
    end
    tweets
  end

  def dummy_tweets(user)
    tweets = []
    3.times do
      tweets << {text: "Not Found", profile_image_url: "", user_name: user, screen_name: "Not Found"}
    end
    tweets
  end

end
