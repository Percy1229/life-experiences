class ApplicationController < ActionController::Base
    
    include SessionsHelper
    
    private 
    
    def require_user_logged_in
        unless logged_in?
        redirect_to signin_url
        end
    end
    
    def counts(user)
        @count_liked = user.liked.count
    end
end
