class PlaylistsController < ApplicationController
  def show
    @playlist = Playlist.find(params[:id])
  end
  def index

  end
  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.save
    redirect_to @playlist
  end
  private
  def playlist_params
    params.require(:playlist).permit(:name)
  end
end
