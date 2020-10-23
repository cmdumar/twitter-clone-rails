class OpinionsController < ApplicationController
  before_action :set_opinion, only: %i[show edit update destroy]
  before_action :authenticate_user!
  # before_action :is_admin!, except: [:index, :show]
  # GET /opinions
  # GET /opinions.json
  def index
    # @opinions = Opinion.all.order("created_at DESC")
    ids = current_user.following.pluck(:id) << current_user.id
    @opinions = Opinion.where(user_id: ids)
    @opinion = Opinion.new
    @follows = User.all - current_user.following - [current_user]
  end

  # GET /opinions/1
  # GET /opinions/1.json
  def show; end

  # GET /opinions/new
  def new
    @opinion = current_user.opinions.build
  end

  # GET /opinions/1/edit
  def edit; end

  # POST /opinions
  # POST /opinions.json
  def create
    @opinion = current_user.opinions.build(opinion_params)
    ids = current_user.following.pluck(:id) << current_user.id
    @opinions = Opinion.where(user_id: ids)
    @follows = User.all - current_user.following - [current_user]
    respond_to do |format|
      if @opinion.save
        flash[:notice] = 'Opinion created successfully'
        format.html { redirect_back(fallback_location: root_path) }
        format.json { render root_path, status: :created, location: @opinion }
      else
        flash[:alert] = 'Could not create post.'
        format.html { redirect_back(fallback_location: root_path) }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opinions/1
  # PATCH/PUT /opinions/1.json
  def update
    respond_to do |format|
      if @opinion.update(opinion_params)
        format.html { redirect_to @opinion, notice: 'Opinion was successfully updated.' }
        format.json { render :show, status: :ok, location: @opinion }
      else
        format.html { render :edit }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opinions/1
  # DELETE /opinions/1.json
  def destroy
    @opinion.destroy
    respond_to do |format|
      format.html { redirect_to opinions_url, notice: 'Opinion was successfully destroyed.' }
      format.json { head :no_content }
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
