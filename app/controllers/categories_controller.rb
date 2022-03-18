# app/controllers/categories_controller.rb

class CategoriesController < ApplicationController
  before_action :policy_scope_categories, only: [ :index, :show, :new, :edit, :update, :destroy ]

  def index
    if params[:query].present?
      @categories = Category.global_search(params[:query])
    else
      @categories = Category.all
    end
    @bookmark = Bookmark.new
  end

  def show
    @category = Category.find(params[:id])
    @signs = Sign.where(category: @category)
    authorize @category
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  private

  def policy_scope_categories
    @categories = policy_scope(Category)
  end

  def category_params
    params.require(:category).permit(:title)
  end
end
