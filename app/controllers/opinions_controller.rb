class OpinionsController < ApplicationController
  before_action :set_opinion, only: %i[show edit update destroy]
  before_action :authenticate_user!
  # before_action :is_admin!, except: [:index, :show]
  # GET /opinions
  # GET /opinions.json
  def index
    ids = current_user.following.pluck(:id) << current_user.id
    @opinions = Opinion.where(user_id: ids).includes([:user]).order("created_at DESC")
    @opinion = Opinion.new
    @follows = User.all.includes({ profile_picture_attachment: :blob }) - current_user.following - [current_user]
    @comment = current_user.comments.build
  end

  # GET /opinions/new
  def new
    @opinion = current_user.opinions.build
  end

  # POST /opinions
  # POST /opinions.json
  def create
    @opinion = current_user.opinions.build(opinion_params)
    ids = current_user.following.pluck(:id) << current_user.id
    @opinions = Opinion.where(user_id: ids)
    @follows = User.all - current_user.following - [current_user]
    respond_to do |format|
      if @opinion.save
        flash[:notice] = 'Opinion created successfully.'
        format.html { redirect_back(fallback_location: root_path) }
        format.json { render root_path, status: :created, location: @opinion }
      else
        flash[:alert] = @opinion.errors.full_messages.join('. ').to_s
        format.html { redirect_back(fallback_location: root_path) }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_opinion
    @opinion = Opinion.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def opinion_params
    params.require(:opinion).permit(:content)
  end
end
