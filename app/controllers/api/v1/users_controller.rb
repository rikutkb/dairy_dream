require "#{Rails.root}/app/controllers/application_controller.rb"
module Api
    module V1
        class UsersController < ApplicationController
            before_action :set_user, only: [:show,:update,:articles]
            def create
                @user = User.new(user_params)
                if @user.save
                    render json: @user, status: :created
                else
                    render json: @user.errors, status: :conflict
                end
            end
            def index
                render json: User.all, status: :ok
            end
            def show
                render json: @user, status: :ok
            end
            def update
                render json: @user, status: :accepted
            end
            def articles
                render json: @user.articles, status: :ok
            end
            def set_user
                @user = User.find(params[:id])
            end
            def user_params
                params.require(:user).permit(:name,:email,:password,:password_confirmation)
            end
        end
    end

end
