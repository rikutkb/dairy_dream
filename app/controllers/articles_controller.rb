class ArticlesController < ApplicationController
    before_action :logged_in_user,only:[:destroy,:create,:edit,:update]
    before_action :set_article,only:[:show,:destroy,:edit,:update]
    def index
      @articles = current_user.articles
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
          @article.tags_save(place_tags,0,current_user.id)
        end
        person_tags = post_params_with_tags[:person_tag_ids]
        if !person_tags.empty?
          @article.tags_save(person_tags,1,current_user.id)
        end
        flash[:success] = "作成できました"
        redirect_to articles_path
      else
        render 'new'
      end
    end
    def edit
      if logged_in? && @article.user_id == current_user.id
        @article
      else
      end
    end
    def update
      @article.update(post_params)
      flash[:success] = "更新できました"
      redirect_to articles_path
    end
    def show
        @tags = @article.tags
    end
    def destroy

      if logged_in? && @article.user_id == current_user.id
        tags = @article.tags
        if @article.destroy
          tags.each do |tag|
            tag.decrement(:citations,1)
          end
          redirect_to request.referrer

        end

      else
      end
      
    end
    private
      def post_params
        params.require(:article).permit(:content,:day,:memo,:sleep_n,:private)
      end
      def post_params_with_tags
        params.require(:article).permit(:content,:day,:memo,:sleep_n,:private,place_tag_ids: [],person_tag_ids: [])
      end
      def set_article
        @article = Article.find(params[:id])

      end
end
