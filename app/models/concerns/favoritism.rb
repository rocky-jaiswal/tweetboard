module Favoritism
  extend ActiveSupport::Concern

  def add_favorites(user_names)
    if !user_names.nil? && !user_names.empty?
      existing_favs = self.favorites.map(&:user_name)
      user_names.uniq.each do |name|
        unless existing_favs.include?(name)
          self.favorites << Favorite.new({user_name: name})
          self.save
        end
      end
    end
    self.favorites.reload
  end

  def delete_favorites(user_names)
    self.favorites.where(user_name: user_names).destroy_all if !user_names.nil? && !user_names.empty?
    self.favorites.reload
  end

end
