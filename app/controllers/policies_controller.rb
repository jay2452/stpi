class PoliciesController < ApplicationController
  before_action :set_policy, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]

  # GET /policies
  # GET /policies.json
  def index
    @policies = Policy.all.order(created_at: :desc)
  end

  # GET /policies/1
  # GET /policies/1.json
  def show
    authorize! :show, @policy
  end

  # GET /policies/new
  def new
    @policy = Policy.new
    authorize! :new, @policy
  end

  # GET /policies/1/edit
  def edit
    authorize! :edit, @policy
  end

  # POST /policies
  # POST /policies.json
  def create
    @policy = Policy.new(policy_params)
    authorize! :create, @policy

    respond_to do |format|
      if @policy.save
        format.html { redirect_to @policy, notice: 'Policy was successfully created.' }
        format.json { render :show, status: :created, location: @policy }
      else
        format.html { render :new }
        format.json { render json: @policy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /policies/1
  # PATCH/PUT /policies/1.json
  def update
    authorize! :update, @policy
    respond_to do |format|
      if @policy.update(policy_params)
        format.html { redirect_to @policy, notice: 'Policy was successfully updated.' }
        format.json { render :show, status: :ok, location: @policy }
      else
        format.html { render :edit }
        format.json { render json: @policy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /policies/1
  # DELETE /policies/1.json
  def destroy
    authorize! :destroy, @policy
    @policy.destroy
    respond_to do |format|
      format.html { redirect_to policies_url, notice: 'Policy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_policy
      @policy = Policy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def policy_params
      params.require(:policy).permit(:content)
    end
end
