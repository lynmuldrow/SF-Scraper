class ArticlesController < ApplicationController
def index
		# search function using q param - has to exactly match
		if params [:q]
			@articles = Article.where({ :title => params[:q]})
		else 
		@articles = Article.all
		end	
		
		render json: @articles
	end
end
