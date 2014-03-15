require 'spec_helper'

describe TwitterService do

  subject { TwitterService.new }

  before(:each) { subject.stub(:get_last_three_tweets).and_return(["t1", "t2", "t3"]) }

  it "should get tweets for an unlogged user properly" do
    users = ["dhh", "tenderlove", "chadfowler"]
    subject.get_tweets(users).size.should == 3
  end

end
