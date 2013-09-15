require 'spec_helper'

describe TwitterService do

  it "should get tweets for an unlogged user properly" do
    ts = TwitterService.new
    ts.stub(:get_last_three_tweets).and_return(["t1", "t2", "t3"])
    users = ["dhh", "tenderlove", "chadfowler"]
    unfavorited = ["dhh"]
    ts.get_tweets_for_users(users, unfavorited, nil).size.should == 2
  end

  it "should get tweets for an logged in user properly" do
    ts = TwitterService.new
    ts.stub(:get_last_three_tweets).and_return(["t1", "t2", "t3"])
    users = ["dhh", "tenderlove"]
    unfavorited = ["dhh"]
    ts.get_tweets_for_users(users, unfavorited, nil).size.should == 1
  end

end