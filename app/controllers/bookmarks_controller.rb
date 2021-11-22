class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:bookmark][:movie_id])
    @bookmark.list = @list
    @bookmark.movie = @movie
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @list = @bookmark.list
    @bookmark.destroy
    redirect_to(list_path(@list))
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie, :list)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
