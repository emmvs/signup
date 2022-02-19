class SignsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :policy_scope_signs, only: [ :index, :show, :new, :edit, :update, :destroy ]
  before_action :find_sign, only: [ :show, :edit, :update, :destroy ]

  # Why is this called article_params?
  # def article_params
  #   params.require(:sign).permit(:title, :description, :sign)
  # end

  # For the search function
  def index
    if params[:query].present?
      @signs = Sign.search_by_keyword(params[:query])
    else
      @signs = Sign.all
    end
  end

  def show
  end

  def new
    @sign = Sign.new
    authorize @sign
  end

  def create
    @sign = Sign.new(sign_params)
    @sign.user = current_user
    authorize @sign
    if @sign.save
      redirect_to @sign
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
    redirect_to signs_path, notice: "Oh no! bye bye to the amazing sign"
  end

  private

  def find_sign
    @sign = Sign.find(params[:id])
    authorize @sign
  end

  def sign_params
    params.require(:sign).permit(:title, :description, :sign)
  end

  def policy_scope_signs
    @signs = policy_scope(Sign)
  end
end
