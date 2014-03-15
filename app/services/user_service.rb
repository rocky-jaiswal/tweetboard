class UserService

  def initialize(loggedin_user=nil)
    @loggedin_user = loggedin_user
  end

  def update_favorites(favorited, unfavorited)
    if @loggedin_user
      @loggedin_user.add_favorites(favorited)
      @loggedin_user.delete_favorites(unfavorited)
    else
      favorited - unfavorited
    end
  end

end
