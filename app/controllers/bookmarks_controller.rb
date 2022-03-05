class BookmarksController < ApplicationController

  def index
    @bookmark = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user = current_user
    authorize @bookmark
    if @bookmark.save!
      redirect_to bookmark_path(@bookmark)
    else
      render :new
    end
  end
end
