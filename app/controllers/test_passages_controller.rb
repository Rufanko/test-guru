class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]
  before_action :authenticate_user!

  def show; end

  #def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
     end
  end

  def gist
    result = GistQuestionService.new(
      @test_passage.current_question
    ).call

    @gist = current_user.gists.create(question: @test_passage.current_question, url: result[:html_url])

    if result.present? && @gist.save!
      flash[:notice] = t('.success', url: view_context.link_to("Gist", @gist.url, target: :_blank))
    else
      flash[:alert] = t('.failure')
                      end
    redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
