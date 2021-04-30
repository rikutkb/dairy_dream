class DiaryController < ApplicationController
  def index
    @articles = Article.all
  end
  def new

  end
  def create
    Article.create(post_params)
    redirect_to root_path

  end
  private
  def post_params
    params.permit(:content,:day,:memo,:sleep_n)
  end
end
