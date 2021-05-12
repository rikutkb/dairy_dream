class TagsController < ApplicationController
    before_action :logged_in_user,only:[:search]

    def index
    end
    def show
    end
    def create
    end
    def search
        @tags = current_user.tags.where(kind:params[:kind]).where('name LIKE(?)',"%#{params[:keyword]}%")

        render json: @tags
    
    end
end
