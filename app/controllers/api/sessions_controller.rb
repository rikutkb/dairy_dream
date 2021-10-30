class Api::SessionsController < ApplicationController
    def create
      user = User.find_by(name: session_params[:name])
      logger.debug(user)
      logger.debug("--")

      if user&.authenticate(session_params[:password])
        token = Jwt::TokenProvider.call(user_id: user.id)
        render json: ActiveModelSerializers::SerializableResource.new(user, serializer: UserSerializer).as_json.deep_merge(user: { token: token })
      else
        render json: { error: { messages: ['mistake emal or password'] } }, status: :unauthorized
      end
    end
  
    private
  
    def session_params
      params.require(:session).permit(:name, :password)
    end
  end 