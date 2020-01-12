class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]
  before_action :authenticate_user!

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      BadgeService.new(@test_passage).call
      if badge.given?
        flash[:notice] = "vi poluchili badge #{@test_passage.user.badges.last}"
      end
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
     end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    @gist = current_user.gists.new(question: @test_passage.current_question, url: result[:html_url])

    if @gist.save
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
