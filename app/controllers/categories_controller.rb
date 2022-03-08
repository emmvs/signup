class CategoriesController < ApplicationController
before_action :policy_scope_categories, only: [ :index, :show, :new, :edit, :update, :destroy ]

  def index
    if params[:query].present?
      @categories = Category.global_search(params[:query])
    else
      @categories = Category.all
    end
  end

  private
  def policy_scope_categories
    @categories = policy_scope(Category)
  end
end
