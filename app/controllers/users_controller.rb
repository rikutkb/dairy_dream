class UsersController < ApplicationController
  before_action :set_user,only:[:show]
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end
  def show
    @articles = @user.articles
  end
  def index
    @users = User.all
  end

  def edit
  end
  private
    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
    def set_user
      @user = User.find(params[:id])
    end
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
