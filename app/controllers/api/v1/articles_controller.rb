require_dependency "#{Rails.root}/app/controllers/application_controller.rb"
module Api
    module V1
        class ArticlesController < ApplicationController
            before_action :set_article, only: [:show,:update]
            def create
            end
            def index
            end
            def show
                render json: @article
            end
            def update
            end
            def set_article
                @article=api_current_user
            end
        end
    end

end
