class BookmarksController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :policy_scope_bookmarks, only: [ :index, :show, :new, :edit, :update, :destroy ]

  def index
    @bookmarks = policy_scope(Bookmark)
  end

  def show
    authorize @bookmark
  end

  def new
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def create
    @bookmark = Bookmark.new
    @bookmark.user = current_user
    authorize @bookmark
  end

  private

  def policy_scope_bookmarks
    @bookmarks = policy_scope(Bookmark)
  end

end
