class StaticPagesController < ApplicationController
  def home
    if current_user
      redirect_to user_path(current_user)
    else
      redirect_to url_for(controller: :static_pages,only_path: false,action: :help)
    end
  end

  def help
  end

  def about
  end
end
