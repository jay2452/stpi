class FeedsController < ApplicationController

  before_action :set_feed, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]

  def index
    @feeds = Feed.all.order(created_at: :desc)
  end

  def show
    authorize! :read, @feed
  end

  def new
    @feed = Feed.new
    authorize! :new, @feed
  end

  def edit
    authorize! :edit, @feed
  end

  def update
    authorize! :update, @feed
  end

  def create
    @feed = Feed.new(feed_params)
    authorize! :create, @feed

    respond_to do |format|
      if @feed.save
        format.html { redirect_to @feed, notice: 'feed was successfully created.' }
        format.json { render :show, status: :created, location: @feed }
      else
        format.html { render :new }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

  end


    private
      # Use callbacks to share common setup or constraints between actions.
      def set_feed
        @feed = Feed.friendly.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def feed_params
        params.require(:feed).permit(:topic)
      end
end
