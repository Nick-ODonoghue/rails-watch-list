class BookmarksController < ApplicationController
  before_action :set_list, only: [ :new, :create ]
  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmarks_params)
    @bookmark.list = @list

    if @bookmark.save
      redirect_to new_list_bookmark_path(@bookmark)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmarks_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
