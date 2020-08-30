class Api::V1::ChallengesController < Api::V1::ApplicationApiController
  before_action :authenticate, except: %i(index show)
  before_action :set_challenge, only: %i(show edit update destroy)

  # GET /challenges
  # GET /challenges.json
  def index
    @challenges = Challenge.all
  end

  # GET /challenges/1
  # GET /challenges/1.json
  def show
  end

  # GET /challenges/new
  def new
    @challenge = Challenge.new
  end

  # GET /challenges/1/edit
  def edit
  end

  # POST /challenges
  # POST /challenges.json
  def create
    @challenge = Challenge.new(challenge_params)

    if @challenge.valid?
      @challenge.save
      render :show
    else
      render json: @challenge.errors.messages
    end
  end

  # PATCH/PUT /challenges/1
  # PATCH/PUT /challenges/1.json
  def update
    if @challenge.update(challenge_params)
      render :show
    else
      render json: @challenge.errors.messages
    end
  end

  # DELETE /challenges/1
  # DELETE /challenges/1.json
  def destroy
    @challenge.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_challenge
    @challenge = Challenge.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end

  # Only allow a list of trusted parameters through.
  def challenge_params
    params.require(:challenge).permit(:name, :description, :points)
  end
end 