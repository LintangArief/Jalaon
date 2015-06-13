class FeedbacksController < ApplicationController
  def create
    @service = Service.find(params[:feedback][:service_id])
    @feedback = Feedback.new(params_feedback)
    if @feedback.save
      redirect_to @service
    else
      redirect_to @service
    end
  end

  private
    def params_feedback
      params.require(:feedback).permit(:user_id ,:description, :service_id)
    end
end