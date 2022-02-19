class CategoriesController < ApplicationController

  def index
    if params[:query].present?
      @categories = Categorie.global_search(params[:query])
    else
      @categories = Categorie.all
    end
  end

end
