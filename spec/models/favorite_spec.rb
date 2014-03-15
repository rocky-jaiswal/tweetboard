require 'spec_helper'

describe Favorite do

  it "should add favorites" do
    u = FactoryGirl.create(:valid_user)
    favs = u.add_favorites(["dhh", "tenderlove"])
    expect(favs.size).to eq(5)
  end

  it "should not have duplicate favorites" do
    u = FactoryGirl.create(:valid_user)
    favs = u.add_favorites(["dhh", "tenderlove", "dhh"])
    expect(favs.size).to eq(5)
  end

  it "should delete favorties properly" do
    u = FactoryGirl.create(:valid_user)
    favs = u.add_favorites(["dhh", "tenderlove", "chadfowler"])
    favs = u.delete_favorites(["tenderlovemaking", "chadfowler"])
    expect(favs.size).to eq(5)
  end

end
