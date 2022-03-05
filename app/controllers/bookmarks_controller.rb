class BookmarksController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :policy_scope_bookmarks, only: [ :index, :show, :new, :edit, :update, :destroy ]

  def index
    @bookmarks = Bookmark.all
    get_signs
  end

  def show
    authorize @bookmark
  end

  def new
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    # sign = Sign.find(params[:sign_id])
    # @bookmark.sign = sign
    # @bookmark.user = current_user
    authorize @bookmark
    # redirect_to root_path, notice: "bookmark created"
    @bookmark.save!
    flash[:message] = "bookmark created"
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    if @bookmark.update(bookmark_params)
      redirect_to boomarks_path, notice: "Your amazing sign is not a favorite anymore"
    else
      redirect_to bookmarks_path
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    @bookmark.destroy
    redirect_to bookmarks_path, notice: "Oh no! bye bye to the amazing sign"
  end

  private

  def policy_scope_bookmarks
    @bookmarks = policy_scope(Bookmark)
  end

  def get_signs
    @sign = Sign.all
  end

  def bookmark_params
    params.require(:bookmark).permit(:user_id, :sign_id)
  end

end
