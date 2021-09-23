class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(name:session_params[:name])
    if user && user.authenticate(session_params[:password])
      login(user)
      redirect_to url_for(controller: :user,only_path: false,action: :articles,protocol: :'https')
    else
      flash.now[:danger] = 'invalid name or password'
      render new_article_path(protocol: 'https')
    end
  end
  def destroy
    logout
    redirect_to root_path(protocol: 'https')
  end

  def session_params
    params.require(:session).permit(:name,:password)
  end
end
