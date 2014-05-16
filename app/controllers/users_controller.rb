class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    begin
      @user = User.find(params[:id])
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    rescue
      reset_session
      redirect_to :controller => 'guests', action: 'index'
    end
  end
end
