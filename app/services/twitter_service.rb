class TwitterService

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Figaro.env.tw_c_key
      config.consumer_secret     = Figaro.env.tw_c_secret
      config.access_token        = Figaro.env.tw_a_token
      config.access_token_secret = Figaro.env.tw_a_secret
    end
  end

  def get_last_three_tweets(user)
    cleanup_tweets(@client.user_timeline(user, {count: 3}))
  end

  def cleanup_tweets(tws)
    tweets = []
    tws.map do |tw| 
      tweets << {text: tw.text, profile_image_url: tw.user.profile_image_url.to_s, user_name: tw.user.name, screen_name: tw.user.screen_name}
    end
    tweets
  end

end