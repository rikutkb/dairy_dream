class ArticlesController < ApplicationController
    before_action :logged_in_user,only:[:destroy,:create]
    before_action :set_article,only:[:show]
    def index
      @articles = Article.all
    end
    def new
        @article = current_user.articles.new

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
    end
    def show
        
    end
    def destroy
      @article.destroy
      
    end
    private
      def post_params
        params.require(:article).permit(:content,:day,:memo,:sleep_n)
      end
      def set_article
        @article = Article.find(params[:id])
        
      end
end
