class UserController < ApplicationController
    def login
        @title = "Login"
    end

    def friends
        @title = "Friends"
        @facebook_cookies ||= Koala::Facebook::OAuth.new.get_user_info_from_cookie(cookies)
        if @facebook_cookies != nil
            @access_token = @facebook_cookies["access_token"]
            @graph = Koala::Facebook::GraphAPI.new(@access_token)
            @me, @friends, @likes = @graph.batch do |batch_api|
                batch_api.get_object('me')
                batch_api.get_connections('friends')
                batch_api.get_connections('likes')
            end
        else
            redirect_to login_path 
        end
    end

    def likes
          @title = "Likes"
    end
end
