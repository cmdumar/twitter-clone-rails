class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @opinion = Opinion.new
    @opinions = Opinion.where(user_id: @user)
    @follows = User.all - @user.following - [@user]
  end
end
