class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(id)
    @opinion = Opinion.new
    @opinions = Opinion.where(user_id: @user).includes([:user])
    @follows = User.all.includes({ profile_picture_attachment: :blob }) - @user.following - [@user]
    @followers = @user.followers
  end

  private
  
  def id
    params[:id]
  end
end
