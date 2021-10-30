class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    include SessionsHelper
    #for api
    class AuthenticationError < StandardError; end
    rescue_from ActiveRecord::RecordInvalid, with: :render_422
    rescue_from AuthenticationError, with: :not_authenticated
    def authenticate
        raise AuthenticationError unless api_current_user
    end
    def api_current_user
        logger.debug("---")
        logger.debug(request.headers)
        @api_current_user ||= Jwt::UserAuthenticator.call(request.headers)
    end
    def not_authenticated
        render json:{ error:{messages: ['not authenticated']}}, status: :unauthorized
    end
    # end for api
    def logged_in_user
        unless logged_in?

            store_location
            flash[:danger] ="please login"
            redirect_to url_for(controller: :sessions,action: :login)
        end
    end
end
