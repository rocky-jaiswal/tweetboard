require 'spec_helper'

describe UserService do

  let(:user) { FactoryGirl.create(:valid_user) }

  subject { UserService.new(user) }

  it "updates favorites" do
    expect(user.favorites.count).to eq(3)
    favs = subject.update_favorites(nil, [user.favorites.first.user_name])
    expect(favs.count).to eq(2)
  end

end
