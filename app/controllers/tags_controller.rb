class TagsController < ApplicationController
    protect_from_forgery :except => [:create]
    before_action :logged_in_user,only:[:create,:search,:index]

    def index
        @tags = current_user.tags.order('count DESC')
    end
    def show
    end
    def create
        @tag = current_user.tags.create(
            name:params[:keyword],
            kind:params[:kind]
        )
        render json: @tag
    end
    def search
        @tags = current_user.tags.where(kind:params[:kind]).where('name LIKE(?)',"%#{params[:keyword]}%")
        render json: @tags
    
    end
end
