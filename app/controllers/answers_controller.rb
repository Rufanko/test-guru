class AnswersController < ApplicationController
  before_action :set_answer, only: %i[show]
  before_action :authenticate_user!
  def index
    @answers = Answer.all
  end

  def show; end


  private
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:content, :correct)
    end
end
