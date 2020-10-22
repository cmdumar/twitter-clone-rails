class FollowingController < ApplicationController
  def create
    # @follower = current_user.active_relationships.build(follow_params)
    user = User.find(params[:user_id])
    current_user.follow(user)
    redirect_to root_path
  end

  def destroy
    
  end
end
