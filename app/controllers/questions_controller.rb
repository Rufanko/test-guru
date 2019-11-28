class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show destroy update edit]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_couldnt_find_question

  def show
    @test = @question.test
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @test
    else
      render :new
     end
  end

  def edit; end

  def destroy
    @question.destroy
    render plain: 'Question successfully deleted'
  end

  def update
    if @question.update(test_params)
      redirect_to @question
    else
      render :edit
    end
 end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:content)
  end

  def rescue_couldnt_find_question
    render plain: 'could not find question'
  end
end
