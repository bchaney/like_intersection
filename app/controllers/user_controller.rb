class UserController < ApplicationController
    def login
        @title = "Login"
    end

    def friends
        @title = "Friends"
        @facebook_cookies ||= Koala::Facebook::OAuth.new.get_user_info_from_cookie(cookies)
        if @facebook_cookies != nil
            @access_token = @facebook_cookies["access_token"]
            @api = Koala::Facebook::API.new(@access_token)
            @me, @friends, @likes = @api.batch do |batch_api|
                batch_api.get_object('me')
                batch_api.get_connections('me', 'friends')
                batch_api.get_connections('me', 'likes')
            end
        else
            redirect_to login_path 
        end
    end

    def likes
          @title = "Likes"
    end
end
