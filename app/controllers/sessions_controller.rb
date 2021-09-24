class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(name:session_params[:name])
    if user && user.authenticate(session_params[:password])
      login(user)
      redirect_to url_for(controller: :users,id: user.id,action: :articles)
    else
      flash.now[:danger] = 'invalid name or password'
      render new_article_path
    end
  end
  def destroy
    logout
    redirect_to url_for(controller: :static_pages,action: :home)
  end

  def session_params
    params.require(:session).permit(:name,:password)
  end
end
