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
        place_tags = post_params_with_tags[:place_tag_ids]
        if !place_tags.empty?
          @article.tags_save(place_tags)
        end
        person_tags = post_params_with_tags[:person_tag_ids]
        if !person_tags.empty?
          @article.tags_save(person_tags)
        end
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
        @article = Article.find(params[:id])
    end
    def destroy
      if logged_in? && @article.id == current_user.id
        tags = @article.tags
        if @article.destroy
          tags.each do |tag|
            tag.decrement(:citations,1)
          end
        end

      else
      end
      
    end
    private
      def post_params
        params.require(:article).permit(:content,:day,:memo,:sleep_n)
      end
      def post_params_with_tags
        params.require(:article).permit(:content,:day,:memo,:sleep_n,place_tag_ids: [],person_tag_ids: [])
      end
      def set_article
        @article = Article.find(params[:id])
        
      end
end
