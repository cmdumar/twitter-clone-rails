class FollowingController < ApplicationController
  def create
    current_user.follow(params[:user_id])
    redirect_to root_path
  end

  def destroy
  end
end
