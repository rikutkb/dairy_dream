class StaticPagesController < ApplicationController
  def home
    if current_user
      redirect_to url_for(controller: :users,only_path: false,action: :articles,protocol: :'https')
    else
      redirect_to url_for(controller: :static_pages,only_path: false,action: :help,protocol: :'https')
    end
  end

  def help
  end

  def about
  end
end
