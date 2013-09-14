class Favorite < ActiveRecord::Base
  attr_accessible :user_id, :user_name

  belongs_to :user

  validates :user_name, uniqueness: { scope: :user_id, message: "user should have unique favorites" }
end
