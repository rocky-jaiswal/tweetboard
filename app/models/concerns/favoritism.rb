module Favoritism
  extend ActiveSupport::Concern

  def add_favorites(user_names)
    new_favs = user_names.each do |name|
      f = Favorite.new({user_name: name})
      self.favorites << f
      self.save
    end
    User.find(self.id).favorites.map{|f| f.user_name}
  end

  def delete_favorites(user_names)
    return nil if user_names.nil? || user_names.empty?
    user_names.each do |name|
      f = self.favorites.where(:user_name => name).first
      f.delete if f
    end
  end

end