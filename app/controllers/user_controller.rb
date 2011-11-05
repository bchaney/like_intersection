class UserController < ApplicationController
    before_filter :parse_facebook_cookies

    def parse_facebook_cookies
        @facebook_cookies ||= Koala::Facebook::OAuth.new.get_user_info_from_cookie(cookies)
    end
    
    def login
        @title = "Login"
        if @facebook_cookies != nil
            redirect_to friends_path
        end
    end

    def friends
        @title = "Friends"
    #    @facebook_cookies ||= Koala::Facebook::OAuth.new.get_user_info_from_cookie(cookies)
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
        currFriendId = params[:id]
        @currFriendLikes = @api.get_connections(currFriendId.to_s, 'likes')
    end
end
