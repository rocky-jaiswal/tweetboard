class User < ActiveRecord::Base
  include Favoritism
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :password, :password_confirmation, :favorites

  devise  :database_authenticatable, :registerable,
          :trackable, :validatable,
          :recoverable, :token_authenticatable, :confirmable,
          :lockable, :timeoutable


  has_many :favorites, :uniq => true
end
