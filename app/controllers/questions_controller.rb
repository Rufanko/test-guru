class QuestionsController < ApplicationController
 	
 	before_action :find_test
 	before_action :find_question
 	rescue_from ActiveRecord::RecordNotFound, with: :rescue_couldnt_find_question 

	def index 
		render json: @test.questions
	end

	def show
		render plain: question.inspect
	end

	def create
		@test.questions.create(question_params)
		render plain: 'Question successfully created'
	end


	def destroy
		@question.destroy
		render plain: 'Question successfully deleted'
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
		render plain: 'couldnt find question'
	end

end
