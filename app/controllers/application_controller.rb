class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper

    def logged_in_user
        unless logged_in?

            store_location
            flash[:danger] ="please login"
            redirect_to url_for(controller: :sessions,only_path: false,action: :login,protocol: :'https')
        end
    end
end
