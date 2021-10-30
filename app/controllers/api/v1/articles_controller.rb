require "#{Rails.root}/app/controllers/application_controller.rb"
module Api
    module V1
        class ArticlesController < ApplicationController
            before_action :set_user, only: [:show,:update]
            def create
            end
            def index
            end
            def show
            end
            def update
            end
            def set_article
            end
        end
    end

end
