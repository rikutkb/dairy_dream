class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    include SessionsHelper

    def logged_in_user
        unless logged_in?

            store_location
            flash[:danger] ="please login"
            redirect_to login_url(protocol: 'https')
        end
    end
end
