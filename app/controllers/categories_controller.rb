class CategoriesController < ApplicationController

  def index
    if params[:query].present?
      @categories = Category.global_search(params[:query])
    else
      @categories = Category.all
    end
  end

end
