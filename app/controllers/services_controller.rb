class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  # GET /services
  # GET /services.json
  def index
    @services = Service.all.order(created_at: :desc)
  end

  # GET /services/1
  # GET /services/1.json
  def show
    authorize! :show, @service
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /services/new
  def new
    @service = Service.new
    authorize! :new, @service
  end

  # GET /services/1/edit
  def edit
    authorize! :edit, @service
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)
    authorize! :create, @service

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    authorize! :update, @service
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    authorize! :destroy, @service
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:title, :content)
    end
end
