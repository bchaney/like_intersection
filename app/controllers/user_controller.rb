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
        if @facebook_cookies != nil
            api = Koala::Facebook::API.new(@facebook_cookies["access_token"])
            @me, @friends = api.batch do |batch_api|
                batch_api.get_object('me')
                batch_api.get_connections('me', 'friends')
            end
            @friends.sort_by { |item| item[:name] }            
        else
            redirect_to login_path 
        end
    end

    def likes
        @title = "Like Intersection"
        if @facebook_cookies != nil
            api = Koala::Facebook::API.new(@facebook_cookies["access_token"])
            currFriendId = params[:id]
            @currFriendName = params[:name]
            currFriendLikes = api.get_connections(currFriendId, 'likes')
            myLikes = api.get_connections('me', 'likes')
            @intersectionLikes = []
            currFriendLikes.each do |friendLike|
                myLikes.each do |myLike|
                    if friendLike["id"] == myLike["id"]
                        @intersectionLikes << myLike
                        next
                    end
                end
            end
            #@intersectionLikes = @currFriendLikes & @myLikes 
        end
    end
end
