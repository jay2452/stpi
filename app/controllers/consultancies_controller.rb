class ConsultanciesController < ApplicationController
  before_action :set_consultancy, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]

  # GET /consultancies
  # GET /consultancies.json
  def index
    @consultancies = Consultancy.all.order(created_at: :desc)
  end

  # GET /consultancies/1
  # GET /consultancies/1.json
  def show
    authorize! :read, @consultancy
  end

  # GET /consultancies/new
  def new
    @consultancy = Consultancy.new
    authorize! :new, @consultancy
  end

  # GET /consultancies/1/edit
  def edit
    authorize! :edit, @consultancy
  end

  # POST /consultancies
  # POST /consultancies.json
  def create
    @consultancy = Consultancy.new(consultancy_params)
    authorize! :create, @consultancy

    respond_to do |format|
      if @consultancy.save
        format.html { redirect_to @consultancy, notice: 'Consultancy was successfully created.' }
        format.json { render :show, status: :created, location: @consultancy }
      else
        format.html { render :new }
        format.json { render json: @consultancy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consultancies/1
  # PATCH/PUT /consultancies/1.json
  def update
    authorize! :update, @consultancy
    respond_to do |format|
      if @consultancy.update(consultancy_params)
        format.html { redirect_to @consultancy, notice: 'Consultancy was successfully updated.' }
        format.json { render :show, status: :ok, location: @consultancy }
      else
        format.html { render :edit }
        format.json { render json: @consultancy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consultancies/1
  # DELETE /consultancies/1.json
  def destroy
    authorize! :destroy, @consultancy
    @consultancy.destroy
    respond_to do |format|
      format.html { redirect_to consultancies_url, notice: 'Consultancy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consultancy
      @consultancy = Consultancy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consultancy_params
      params.require(:consultancy).permit(:content)
    end
end
