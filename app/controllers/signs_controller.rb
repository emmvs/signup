class SignsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :policy_scope_signs, only: [ :index, :show, :new, :edit, :update, :destroy ]
  before_action :find_sign, only: [ :show, :edit, :update, :destroy ]

  # For the search function
  def index
    if params.present?
      @items = []
      if params[:language]
        @items += Sign.where(language: params[:language])
      end
      if params[:query]
        @items += Sign.where(title: params[:query]).or(Sign.where(description: params[:query]))
        # sql_query = "title ILIKE @@ :query OR description ILIKE @@ :query"
        # @items += Sign.joins(:category).where(sql_query, query: "%#{params[:query]}%")
      end
      # @signs = Sign.global_search(params[:language])
      @signs = @items.uniq
    else
      @signs = Sign.all
    end
  end

  def show
    authorize @sign
  end

  def new
    @sign = Sign.new
    authorize @sign
    @categories = Category.all
  end

  def create
    @sign = Sign.new(sign_params)
    @sign.user = current_user
    authorize @sign
    if @sign.save!
      redirect_to sign_path(@sign)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @sign.update(sign_params)
      redirect_to @sign, notice: "Your amazing sign is edited"
    else
      render :edit
    end
  end

  def destroy
    @sign.destroy
    redirect_to signs_path, notice: "Oh no! Bye bye to the amazing Sign 👋"
  end

  private

  def find_sign
    @sign = Sign.find(params[:id])
    authorize @sign
  end

  def sign_params
    params.require(:sign).permit(:language, :title, :description, :video, :category_id)
  end

  def policy_scope_signs
    @signs = policy_scope(Sign)
  end
end
