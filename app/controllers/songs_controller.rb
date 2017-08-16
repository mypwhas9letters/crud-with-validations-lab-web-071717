class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def show
    @song = Song.find(params[:id])
  end

  def create
    @song = Song.new(strong_params(:title, :released, :release_year, :artist_name, :genre))
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def update
    @song = Song.find(params[:id])
    @song.update(strong_params(:title))
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def destroy
    @song = Song.find(params[:id]).destroy
    redirect_to songs_path
  end

  private
  def strong_params(*args)
    params.require(:song).permit(*args)
  end

end
