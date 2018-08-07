class ArticlesController < ApplicationController


def index
@articles = Article.all

end



def new

@article = Article.new

end

def create


@article= Article.new(article_params)
#pass in what has been submitted though article_params method
if @article.save
flash[:notice]= "Article was successfully create"

redirect_to article_path(@article)

else
render 'new'
#if fails render new.html.erb template again
 end 
end




def update

@article= Article.find(params[:id])
#the article that you are looking for found by its ID


if @article.update(article_params)


#if update is pressed and validations are successfull then show a notice
flash[:notice]= "Article was successfully Updated"
redirect_to article_path(@article)
#then redirect to the article path

else 
render 'edit'
#if fails render edit template again
end
end


def edit
@article = Article.find(params[:id])
end



def show

@article= Article.find(params[:id])

end


private
def article_params
params.require(:article).permit(:title, :description)
#to pass in what has been submitted from article
end

end
