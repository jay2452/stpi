class SubCentersController < ApplicationController
  before_action :set_sub_center, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]

  # GET /sub_centers
  # GET /sub_centers.json
  def index
    @sub_centers = SubCenter.all
  end

  # GET /sub_centers/1
  # GET /sub_centers/1.json
  def show
    authorize! :show, @sub_center
  end

  # GET /sub_centers/new
  def new
    @sub_center = SubCenter.new
    authorize! :new, @sub_center
  end

  # GET /sub_centers/1/edit
  def edit
    authorize! :edit, @sub_center
  end

  # POST /sub_centers
  # POST /sub_centers.json
  def create
    @sub_center = SubCenter.new(sub_center_params)
    authorize! :create, @sub_center

    respond_to do |format|
      if @sub_center.save
        format.html { redirect_to @sub_center, notice: 'Sub center was successfully created.' }
        format.json { render :show, status: :created, location: @sub_center }
      else
        format.html { render :new }
        format.json { render json: @sub_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_centers/1
  # PATCH/PUT /sub_centers/1.json
  def update
    authorize! :update, @sub_center
    respond_to do |format|
      if @sub_center.update(sub_center_params)
        format.html { redirect_to @sub_center, notice: 'Sub center was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_center }
      else
        format.html { render :edit }
        format.json { render json: @sub_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_centers/1
  # DELETE /sub_centers/1.json
  def destroy
    authorize! :destroy, @sub_center
    @sub_center.destroy
    respond_to do |format|
      format.html { redirect_to sub_centers_url, notice: 'Sub center was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_center
      @sub_center = SubCenter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_center_params
      params.require(:sub_center).permit(:content)
    end
end
