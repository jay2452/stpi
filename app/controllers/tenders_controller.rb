class TendersController < ApplicationController
  before_action :set_tender, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  # GET /tenders
  # GET /tenders.json
  def index
    @tenders = Tender.all.order(created_at: :desc)
  end

  # GET /tenders/1
  # GET /tenders/1.json
  def show
    authorize! :show, @tender
  end

  # GET /tenders/new
  def new
    @tender = Tender.new
    authorize! :new, @tender
  end

  # GET /tenders/1/edit
  def edit
    authorize! :edit, @tender
  end

  # POST /tenders
  # POST /tenders.json
  def create
    @tender = Tender.new(tender_params)
    authorize! :create, @tender

    respond_to do |format|
      if @tender.save
        format.html { redirect_to @tender, notice: 'Tender was successfully created.' }
        format.json { render :show, status: :created, location: @tender }
      else
        format.html { render :new }
        format.json { render json: @tender.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tenders/1
  # PATCH/PUT /tenders/1.json
  def update
    authorize! :update, @tender
    respond_to do |format|
      if @tender.update(tender_params)
        format.html { redirect_to @tender, notice: 'Tender was successfully updated.' }
        format.json { render :show, status: :ok, location: @tender }
      else
        format.html { render :edit }
        format.json { render json: @tender.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tenders/1
  # DELETE /tenders/1.json
  def destroy
    authorize! :destroy, @tender
    @tender.destroy
    respond_to do |format|
      format.html { redirect_to tenders_url, notice: 'Tender was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tender
      @tender = Tender.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tender_params
      params.require(:tender).permit(:content)
    end
end
