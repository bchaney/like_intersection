class UserController < ApplicationController
  def login
      @title = "Login"
  end

  def friends
      @title = "Friends"
  end

  def likes
      @title = "Likes"
  end

end
