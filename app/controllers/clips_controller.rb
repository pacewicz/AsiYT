class ClipsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_clip, only: [:create, :edit, :update, :destroy, :index, :show, :rate]

  def index
    redirect_to :controller => 'playlists', :action => 'show', :id => @playlist.id
  end

  def show
    if (params[:id] == "0" and not @playlist.clips.empty?) then redirect_to :controller => 'playlists', :action => 'show', :id => @playlist_id end
  end

  def new
    redirect_to :controller => 'clips', :action => 'show', :id => 0, :playlist_id => @playlist_id
  end

  def create
    @cparams = params_from_url_and_desc(clip_params)
    if @cparams[:lookup_ok] then
      @clip = Clip.new(cparams)
      @clip.save
      redirect_to :controller => 'clips', :action => 'show', :playlist_id => @playlist_id, :id => @clip.id
    else
      redirect_to :controller => 'playlists', :action => 'show', :id => @playlist.id, notice: 'Url not recognized or in a bad format.'
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @clip.update(clip_params)
        format.html { redirect_to @playlist, notice: 'Playlist updated' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @clip.destroy
    respond_to do |format|
      format.html { redirect_to playlist_url }
      format.json { head :no_content }
    end
  end

  private

  def set_clip
    begin
      @clip = Clip.find(params[:id]) if params[:id] and (params[:id] != "0")
      @playlist_id = params[:playlist_id]
      @playlist = Playlist.find(@playlist_id)
    rescue
      redirect_to controller: 'playlists', action: 'index'
    end
  end

  def clip_params
    params.require(:clip).permit(:yt_id, :description, :playlist_id, :user_id)
  end

  def params_from_url_and_desc(h)
    lookup_ok = true
    begin
      vi = VideoInfo.new(h[:yt_id])
    rescue
      lookup_ok = false
    end
    if lookup_ok then
      {yt_id: vi.video_id, title: vi.title, thumbnail: vi.thumbnail_medium, description: h[:description], playlist_id: @playlist_id, user_id: current_user.id, lookup_ok: lookup_ok}
    else
      {lookup_ok: false}
    end
  end
end
