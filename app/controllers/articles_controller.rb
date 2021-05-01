class ArticlesController < ApplicationController
    before_action :logged_in_user,only:[:destroy,:create]
    before_action :set_article,only:[:show,:destroy]
    def index
      @articles = Article.all.where(private:false)
    end
    def new
        if logged_in?
            @article = current_user.articles.new
        else
            redirect_to root_path
        end

    end
    def create
      @article = current_user.articles.build(post_params)
      if @article.save
        flash[:success] = "作成できました"
        redirect_to root_url
      else
        render 'new'
      end
  
    end
    def edit
      if logged_in? && @article.id == current_user.id
        @article
      else
      end
    end
    def show
        
    end
    def destroy
      if logged_in? && @article.id == current_user.id
      else
      end
      
    end
    private
      def post_params
        params.require(:article).permit(:content,:day,:memo,:sleep_n)
      end
      def set_article
        @article = Article.find(params[:id])
        
      end
end
