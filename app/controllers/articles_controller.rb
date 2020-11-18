class ArticlesController < ApplicationController

    def show
        @article = Article.find(params[:id])
    end

    def index
       @articles = Article.all  
    end

    def new
			@article = Article.new
    end
    
    def create
				# render plain: params[:article]
				# strong parameters - whitelisting of data that is received through the params hash
				@article = Article.new(params.require(:article).permit(:title, :description))
				# render plain: @article.inspect
				if @article.save
					flash[:notice] = "Article was created successfully."
					redirect_to article_path(@article)
				else 
					render 'new'
				end
		end
		

end