class StaticPagesController < ApplicationController
  def home
    if current_user
      redirect_to user_path(current_user)+'/articles'
    else
      redirect_to action: :help
    end
  end

  def help
  end

  def about
  end
end
