class DiariesController < ApplicationController
    before_action :set_article,only:[:show,:edit]
    def index
      @articles = Article.all
    end
    def new
      @article = Article.new
    end
    def create
      @article=Article.create(post_params)
      if @article.save
        redirect_to @article
      else
        render 'new'
      end
  
    end
    def edit
    end
    def show
    end
    private
      def post_params
        params.permit(:content,:day,:memo,:sleep_n)
      end
      def set_article
        @article = Article.find(params[:id])
        
      end
end
