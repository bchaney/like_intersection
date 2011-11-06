module UserHelper
    def add_friend(friend) 
        html = ""
        html << "<td>"
        html << "#{link_to(image_tag("http://graph.facebook.com/" + 
                                        friend["id"] + "/picture", 
                                        :class => "round"), 
                                        likes_path(friend), friend)}"
        html << "<br>#{link_to(friend["name"], likes_path(friend), friend)}"
        html << "</td>
end
