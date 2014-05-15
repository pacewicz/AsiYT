class ClipsController < ApplicationController
  before_action :set_clip, only: [:create, :edit, :update, :destroy, :index, :show]

  def index

  end

  def show

  end

  def new
    redirect_to :controller => 'clips', :action => 'show', :id => 0, :playlist_id => @playlist_id
  end

  def create
    @clip = Clip.new(ClipsHelper.params_from_url_and_desc(clip_params))
    @clip.user_id = 1
    @clip.save
    redirect_to :back
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
    @clip = Clip.find(params[:id]) if params[:id] and (params[:id] != "0")
    @playlist_id = params[:playlist_id]
    @playlist = Playlist.find(@playlist_id)
  end

  def clip_params
    params.require(:clip).permit(:url, :description, :playlist_id, :user_id)
  end
end
