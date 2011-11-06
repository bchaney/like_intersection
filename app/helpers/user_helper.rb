module UserHelper
    def add_friend(friend) 
        data = ""
        data << "<td><div class='centerMe'>"
        data << "#{link_to(image_tag("http://graph.facebook.com/" + 
                                        friend["id"] + "/picture", 
                                        :class => "round"), 
                                        likes_path(friend), friend)}"
        data << "<br>#{link_to(friend["name"], likes_path(friend), friend)}"
        data << "</div></td>"
        data.html_safe
    end
end
