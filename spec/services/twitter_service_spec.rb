require 'spec_helper'

describe TwitterService do

  let(:no_user) { nil }

  subject { TwitterService.new(no_user) }

  before(:each) { subject.stub(:get_last_three_tweets).and_return(["t1", "t2", "t3"]) }

  it "should get tweets for an unlogged user properly" do
    users = ["dhh", "tenderlove", "chadfowler"]
    unfavorited = ["dhh"]
    subject.get_tweets_for_users(users, unfavorited).size.should == 2
  end

  it "should get tweets for an logged in user properly" do
    users = ["dhh", "tenderlove"]
    unfavorited = ["dhh"]
    subject.get_tweets_for_users(users, unfavorited).size.should == 1
  end

end