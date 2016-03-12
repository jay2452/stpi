class FeedbacksController < ApplicationController
  def index
  end

  # def new
  #   @feedback = Feedback.new
  # end

  def show_all
    @feedbacks = Feedback.all.order(created_at: :desc)
  end

  def create
    @feedback = Feedback.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to :root, notice: 'feedback was successfully created.' }
      else
        format.html { render :index, notice: 'error saving feedback' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_params
      params.require(:feedback).permit(:name, :email, :subject, :description)
    end

end
