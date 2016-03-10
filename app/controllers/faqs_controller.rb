class FaqsController < ApplicationController
  before_action :set_faq, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  # GET /faqs
  # GET /faqs.json
  def index
    @faqs = Faq.all
  end

  # GET /faqs/1
  # GET /faqs/1.json
  def show
    authorize! :read, @faq
  end

  # GET /faqs/new
  def new
    @faq = Faq.new
    authorize! :new, @faq
  end

  # GET /faqs/1/edit
  def edit
    authorize! :edit, @faq
  end

  # POST /faqs
  # POST /faqs.json
  def create
    @faq = Faq.new(faq_params)
    authorize! :create, @faq

    respond_to do |format|
      if @faq.save
        format.html { redirect_to @faq, notice: 'Faq was successfully created.' }
        format.json { render :show, status: :created, location: @faq }
      else
        format.html { render :new }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faqs/1
  # PATCH/PUT /faqs/1.json
  def update
    authorize! :update, @faq
    respond_to do |format|
      if @faq.update(faq_params)
        format.html { redirect_to @faq, notice: 'Faq was successfully updated.' }
        format.json { render :show, status: :ok, location: @faq }
      else
        format.html { render :edit }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faqs/1
  # DELETE /faqs/1.json
  def destroy
    authorize! :destroy, @faq
    @faq.destroy
    respond_to do |format|
      format.html { redirect_to faqs_url, notice: 'Faq was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faq
      @faq = Faq.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def faq_params
      params.require(:faq).permit(:content)
    end
end
