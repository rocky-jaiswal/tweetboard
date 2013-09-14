require 'spec_helper'

describe User do
  it "should validate presence of email" do
    u = FactoryGirl.build(:anon_user)
    u.should_not be_valid
    u.save.should == false
  end
end
