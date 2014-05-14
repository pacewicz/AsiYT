class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :destroy]

  def show
  end

  def index
  @playlists = Playlist.all
  end
  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.save
    redirect_to @playlist
  end
  def destroy
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to playlists_url }
      format.json { head :no_content }
    end
  end
  private

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

  def playlist_params
    params.require(:playlist).permit(:name)
  end
end