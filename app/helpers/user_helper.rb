module UserHelper
    def add_friend(friend) 
        data = ""
        data << "<td>"
        img_url = "http://graph.facebook.com/#{friend["id"]}/picture"                      
        img_link = link_to(image_tag(img_url, :class => "round"), 
                                        likes_path(friend), friend)
        text_link = link_to(friend["name"], likes_path(friend), friend)
        # Create a link to the profile picture and like instersection link
        data << img_link
        #link_to(image_tag("http://graph.facebook.com/" + 
        #                                friend["id"] + "/picture", 
        #                                :class => "round"), 
        #                                likes_path(friend), friend)}"
        data << "<br>#{text_link}"
        #data << "<br>#{link_to(friend["name"], likes_path(friend), friend)}"
        data << "</td>"
        data.html_safe
    end
    def add_like(like)
        data = ""
        data << "<td>"
        like_url = "http://www.facebook.com/#{like["id"]}"
        img_url = "http://graph.facebook.com/#{like["id"]}/picture"
        data << "<a href='#{like_url}'>#{image_path(img_url)}</a>"
        data << "<br><a href='#{like_url}'>#{like["name"]}</a>"
        data << "</td>"
        data.html_safe
    end
end
