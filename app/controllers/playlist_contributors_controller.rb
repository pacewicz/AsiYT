class PlaylistContributorsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_playlist, only: [:edit, :update, :destroy, :create]

  def create
    begin
      @contributor = PlaylistContributor.new()
      @contributor.user_id = User.find_by_nick(params[:playlist_contributor][:user_id]).id
      @contributor.playlist_id = @playlist.id
      @contributor.save
      redirect_to :back
    rescue
      redirect_to :back, :alert => "nope"
    end
  end

  def destroy
    begin
      params[:contributor_nick].each do |key, value|
        PlaylistContributor.where(:playlist_id => @playlist.id, :user_id => User.find_by_nick(key)).destroy_all
      end
      redirect_to :back
    rescue
      redirect_to :back, :alert => "nope"
    end
  end

  private

  def set_playlist
    begin
      @playlist = Playlist.find(params[:playlist_id])
    rescue
      redirect_to :controller => 'playlists', :action => 'index'
    end
  end

  def contributor_params
    params.require(:playlist_contributor).permit(:user_id)
  end
end
