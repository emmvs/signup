class SignsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :policy_scope_signs, only: [ :index, :show, :new, :edit, :update, :destroy ]
  before_action :find_sign, only: [ :show, :edit, :update, :destroy ]

  # For the search function
  def index
    if params.present? && ((params[:language].present?) || (params[:query].present?))
      @items = []
      if params[:language].present?
        @items += Sign.where(language: params[:language])
      end
      if params[:query].present?
        # @items += Sign.where(title: params[:query]).or(Sign.where(description: params[:query]))
        @items += Sign.where("title ILIKE ?", "%#{params[:query]}%").or(Sign.where("description ILIKE ?", "%#{params[:query]}%"))
      end
      @signs = find_results(@items.uniq)
    else
      @signs = find_results(Sign.all)
    end
    @bookmark = Bookmark.new

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
    @sign = Sign.find(params[:id])
    authorize @sign
    @sign.destroy
    redirect_to signs_path, notice: "Oh no! Bye bye to the amazing Sign 👋"
  end

  def requests
    authorize Sign
    # find_requests
    @inquiries = current_user.signs
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

  def find_results(signs)
    results = []
    signs.each do |sign|
      if sign.video.attached?
        results << sign
      end
    end
    results
  end
end
