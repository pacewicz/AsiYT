class RatingsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_rating, only: [:create, :edit, :update, :destroy, :index]

  def index
  end

  def create
    begin
      @rating = Rating.where(:clip_id => @clip.id).first_or_create
      @rating.user_id = current_user.id
      @rating.value = 4
      @rating.save
      redirect_to :back
    rescue
      redirect_to :back, :alert => "nope"
    end
  end


  # def create
  #   begin
  #     @rating = Rating.new()
  #     @rating.user_id = User.find_by_nick(params[:playlist_contributor][:user_id]).id
  #     @rating.playlist_id = @playlist.id
  #     @rating.save
  #     redirect_to :back
  #   rescue
  #     redirect_to :back, :alert => "nope"
  #   end
  # end

  private

  def set_rating
    begin
      @rating = Rating.find(params[:id]) if params[:id] and (params[:id] != "0")
      @playlist_id = params[:playlist_id]
      @clip_id = params[:clip_id]
      @playlist = Playlist.find(@playlist_id)
    rescue
      redirect_to controller: 'ratings', action: 'index'
    end
  end
end
