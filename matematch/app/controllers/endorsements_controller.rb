class EndorsementsController < ApplicationController
  before_action :set_endorsement, only: [:show, :update, :destroy]

  # GET /endorsements
  # GET /endorsements.json
  def index
    @endorsements = UserEndorsement.all

    render json: @endorsements
  end

  # GET /endorsements/1
  # GET /endorsements/1.json
  def show
    render json: @endorsement
  end

  # POST /endorsements
  # POST /endorsements.json
  def create
    @endorsement = UserEndorsement.new(endorsement_params)

    if @endorsement.save
      render json: @endorsement, status: :created, location: @endorsement
    else
      render json: @endorsement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /endorsements/1
  # PATCH/PUT /endorsements/1.json
  def update
    @endorsement = UserEndorsement.find(params[:id])

    if @endorsement.update(endorsement_params)
      head :no_content
    else
      render json: @endorsement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /endorsements/1
  # DELETE /endorsements/1.json
  def destroy
    @endorsement.destroy

    head :no_content
  end

  private

    def set_endorsement
      @endorsement = UserEndorsement.find(params[:id])
    end

    def endorsement_params
      params.require(:endorsement).permit(:endorser_id, :endorsee_id, :skill)
    end
end
