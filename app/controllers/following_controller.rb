class FollowingController < ApplicationController
  before_action :authenticate_user!
  def create
    user = User.find(user_id)
    current_user.follow(user)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    user = Following.find(id).followed
    current_user.unfollow(user)
    redirect_back(fallback_location: root_path)
  end

  private

  def id
    params[:id]
  end

  def user_id
    params[:user_id]
  end
end
