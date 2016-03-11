class GcellsController < ApplicationController
  before_action :set_gcell, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]

  # GET /gcells
  # GET /gcells.json
  def index
    @gcells = Gcell.all.order(created_at: :desc)
  end

  # GET /gcells/1
  # GET /gcells/1.json
  def show
    authorize! :read, @gcell
  end

  # GET /gcells/new
  def new
    @gcell = Gcell.new
    authorize! :new, @gcell
  end

  # GET /gcells/1/edit
  def edit
    authorize! :edit, @gcell
  end

  # POST /gcells
  # POST /gcells.json
  def create
    @gcell = Gcell.new(gcell_params)
    authorize! :create, @gcell

    respond_to do |format|
      if @gcell.save
        format.html { redirect_to @gcell, notice: 'Gcell was successfully created.' }
        format.json { render :show, status: :created, location: @gcell }
      else
        format.html { render :new }
        format.json { render json: @gcell.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gcells/1
  # PATCH/PUT /gcells/1.json
  def update
    authorize! :update, @gcell
    respond_to do |format|
      if @gcell.update(gcell_params)
        format.html { redirect_to @gcell, notice: 'Gcell was successfully updated.' }
        format.json { render :show, status: :ok, location: @gcell }
      else
        format.html { render :edit }
        format.json { render json: @gcell.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gcells/1
  # DELETE /gcells/1.json
  def destroy
    authorize! :destroy, @gcell
    @gcell.destroy
    respond_to do |format|
      format.html { redirect_to gcells_url, notice: 'Gcell was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gcell
      @gcell = Gcell.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gcell_params
      params.require(:gcell).permit(:content)
    end
end
