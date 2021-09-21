class StaticPagesController < ApplicationController
  def home
    if current_user
      redirect_to user_path(current_user)+'/articles'
    else
      redirect_to url_for(controller: :static_pages,only_path: false,action: :help,protocol: :'https')
    end
  end

  def help
  end

  def about
  end
end
