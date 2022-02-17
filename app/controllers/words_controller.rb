class WordsController < ApplicationController

def article_params
  params.require(:word).permit(:title, :description, :video)
end
end
