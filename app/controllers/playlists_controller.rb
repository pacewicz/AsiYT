class PlaylistsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]

  def show
     if @playlist.clips.empty?
       redirect_to :controller => 'clips', :action => 'show', :id => 0, :playlist_id => params[:id]
     else
      redirect_to :controller => 'clips', :action => 'show', :id => @playlist.clips.first.id, :playlist_id => @playlist.id
     end
  end

  def index
    @playlists = User.first.playlists
  end
  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user_id = 1
    @playlist.save
    redirect_to :back
  end

  def edit
  end

  def update
    respond_to do |format|
      if @playlist.update(playlist_params)
        format.html { redirect_to @playlist, notice: 'Playlist' }
      else
        format.html { render action: 'edit' }
      end
    end
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