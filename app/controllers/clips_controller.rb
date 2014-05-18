class ClipsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_clip, only: [:create, :edit, :update, :destroy, :index, :show, :rate]

  def index

  end

  def show
    if (params[:id] == "0" and not @playlist.clips.empty?) then redirect_to :controller => 'playlists', :action => 'show', :id => @playlist_id end
  end

  def new
    redirect_to :controller => 'clips', :action => 'show', :id => 0, :playlist_id => @playlist_id
  end

  def create
    @clip = Clip.new(params_from_url_and_desc(clip_params))
    @clip.user_id = current_user.id
    @clip.save
    redirect_to :controller => 'clips', :action => 'show', :playlist_id => @playlist_id, :id => @clip.id
  end

  def edit
  end

  def update
    respond_to do |format|
      if @clip.update(clip_params)
        format.html { redirect_to @playlist, notice: 'Playlist' }
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
    vi = VideoInfo.new(h[:yt_id])
    {yt_id: vi.video_id, title: vi.title, thumbnail: vi.thumbnail_medium, description: h[:description], playlist_id: @playlist_id, user_id: current_user.id }
  end
end
