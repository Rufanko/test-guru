class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy update edit ]
  before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_couldnt_find_question

  def show; end


  private

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:content)
  end

  def rescue_couldnt_find_question
    render plain: 'could not find question'
  end

  def find_answer
      @answer = Answer.find(params[:id])
   end

end
