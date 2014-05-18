class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :configure_permitted_parameters, if: :devise_controller?

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:nick, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:nick, :email, :password, :password_confirmation, :current_password) }
  end

  def verify_user_access
    if params[:playlist_id] then
      @pid = params[:playlist_id] #playlists
    else
      @pid = @playlist.id #clips
    end
    not_owner = Playlist.where(:user_id => current_user.id, :id => @pid).empty?
    if not_owner && (!not_owner and (PlaylistContributor.where(playlist_id: @pid).count > 0) and PlaylistContributor.where(user_id: current_user.id, playlist_id: @pid).count == 0) then
      render :status  => :forbidden, :text => "Access denied. Not owner: "+Playlist.where(:user_id => current_user.id, :id => @pid).empty?.to_s+"<br/>Not shared: "+((PlaylistContributor.where(playlist_id: @pid).count > 0) and PlaylistContributor.where(user_id: current_user.id, playlist_id: @pid).count == 0).to_s
    end
    #render :status  => :forbidden, :text => "Access denied. Not owner: "+Playlist.where(:user_id => current_user.id, :id => @pid).empty?.to_s+"<br/>Not shared: "+((PlaylistContributor.where(playlist_id: @pid).count > 0) and PlaylistContributor.where(user_id: current_user.id, playlist_id: @pid).count == 0).to_s
  end
end
