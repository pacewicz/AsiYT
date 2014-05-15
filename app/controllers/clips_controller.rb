class ClipsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_clip, only: [:edit, :update, :destroy]

  def show

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

  def set_playlist
    @clip = Clip.find(params[:id])
    @playlist = @clip.playlist
  end

  def clip_params
    params.require(:clip).permit(:url, :description)
  end
end
