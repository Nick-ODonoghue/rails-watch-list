class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    @bookmark.save
    redirect_to list_bookmarks_path
  end

  private

  def lists_params
    params.require(:bookmark).permit(:name, :comment)
  end
end
