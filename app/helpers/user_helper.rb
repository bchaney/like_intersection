module UserHelper
    def add_friend(friend) 
        data = ""
        data << "<td align='center'>"
        data << "#{link_to(image_tag("http://graph.facebook.com/" + 
                                        friend["id"] + "/picture", 
                                        :class => "round"), 
                                        likes_path(friend), friend)}"
        data << "<br>#{link_to(friend["name"], likes_path(friend), friend)}"
        data << "</td>"
        data.html_safe
    end
end
