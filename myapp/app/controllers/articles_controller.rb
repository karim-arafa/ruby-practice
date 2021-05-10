class ArticlesController < ApplicationController
    before_action :authenticate_user!, except: %i[api_show api_index]
    def index
        @articles = Article.all
    end
    def show
        @article = Article.find(params[:id])
    end
    def new
        @article = Article.new
    end
    def api_index
        @articles = Article.where(user_id: logged_in_user.id)
        render json: @articles
    end
    def edit
        @article = Article.find(params[:id])
    end
    def create
        
        @article = Article.new(article_params.merge(user_id: current_user.id))
       
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end
    def api_show
        @article = Article.find(params[:id])
        render json: @article
    end   
    def update
        @article = Article.find(params[:id])
       
        if @article.update(article_params)
          redirect_to @article
        else
          render 'edit'
        end
    end
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
     
        redirect_to articles_path
    end
    private
        def article_params
          params.require(:article).permit(:title, :text)
        end
end
