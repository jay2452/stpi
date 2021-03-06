class ItParksController < ApplicationController
  before_action :set_it_park, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]

  # GET /it_parks
  # GET /it_parks.json
  def index
    @it_parks = ItPark.all.order(created_at: :desc)
  end

  # GET /it_parks/1
  # GET /it_parks/1.json
  def show
    authorize! :read, @it_park
  end

  # GET /it_parks/new
  def new
    @it_park = ItPark.new
    authorize! :new, @it_park
  end

  # GET /it_parks/1/edit
  def edit
    authorize! :edit, @it_park
  end

  # POST /it_parks
  # POST /it_parks.json
  def create
    @it_park = ItPark.new(it_park_params)
    authorize! :create, @it_park

    respond_to do |format|
      if @it_park.save
        format.html { redirect_to @it_park, notice: 'It park was successfully created.' }
        format.json { render :show, status: :created, location: @it_park }
      else
        format.html { render :new }
        format.json { render json: @it_park.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /it_parks/1
  # PATCH/PUT /it_parks/1.json
  def update
    authorize! :update, @it_park
    respond_to do |format|
      if @it_park.update(it_park_params)
        format.html { redirect_to @it_park, notice: 'It park was successfully updated.' }
        format.json { render :show, status: :ok, location: @it_park }
      else
        format.html { render :edit }
        format.json { render json: @it_park.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /it_parks/1
  # DELETE /it_parks/1.json
  def destroy
    authorize! :destroy, @it_park
    @it_park.destroy
    respond_to do |format|
      format.html { redirect_to it_parks_url, notice: 'It park was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_it_park
      @it_park = ItPark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def it_park_params
      params.require(:it_park).permit(:content)
    end
end
