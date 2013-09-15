require 'spec_helper'

describe Favorite do
  
  it "should not have duplicate favorites" do
    u = FactoryGirl.create(:valid_user)
    favs = u.add_favorites(["dhh", "tenderlove", "dhh"])
    favs.size.should == 2
  end

  it "should delete favorties properly" do
    u = FactoryGirl.create(:valid_user)
    u.add_favorites(["dhh", "tenderlove", "chadfowler"])
    u.delete_favorites(["tenderlovemaking", "chadfowler"])
    u.favorites.size.should == 2
  end
  
end
