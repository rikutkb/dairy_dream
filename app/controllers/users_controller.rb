class UsersController < ApplicationController
  before_action :set_user,only:[:show,:articles]
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to @user
    else
      render 'new'
    end
  end
  def show
  end
  def index
    @users = User.all
  end

  def edit

  end
  def articles
    if @user.id == current_user.id
      @articles = current_user.articles.reorder("#{sort_column} #{sort_direction}").paginate(:page => params[:page],:per_page => 10)
    else
      @articles = @user.articles.where(private: false).reorder("#{sort_column} #{sort_direction}").paginate(:page => params[:page],:per_page => 10)

    end
    logger.debug(@articles)
    render template: "articles/index"
  end
  private
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end
    def sort_column
      %w[created_at updated_at day].include?(params[:sort]) ? params[:sort] : 'created_at'
    end
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
