class ArticlesController < ApplicationController
before_action :set_article, only: [:edit, :update,:destroy,:show] #do this before anythi

def index
@articles = Article.all

end

def destroy


#find article by it's id
@article.destroy
#destroy action from model
flash[:danger] = "Article was successfully deleted"
#show notice that it was destroyed
redirect_to articles_path
#Redirect to articles

end



def new

@article = Article.new

end

def create




@article= Article.new(article_params)
@article.user= User.first
#pass in what has been submitted though article_params method
if @article.save
flash[:success]= "Article was successfully created!"

redirect_to article_path(@article)

else
render 'new'
#if fails render new.html.erb template again
 end
end




def update

set_article
#the article that you are looking for found by its ID


if @article.update(article_params)


#if update is pressed and validations are successfull then show a notice
flash[:success]= "Article was successfully Updated"
redirect_to article_path(@article)
#then redirect to the article path

else
render 'edit'
#if fails render edit template again
end
end


def edit

end



def show



end


private
def article_params
params.require(:article).permit(:title, :description)
#to pass in what has been submitted from article
end

def set_article
@article = Article.find(params[:id])
end

end
