class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]
  before_action :authenticate_user!
  ACCESS_TOKEN = '80124af143735c18904dbf0de9641682b926a9c9'


  def show; end

  def result; end

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
      @test_passage.current_question,
      Octokit::Client.new(access_token: Rails.application.credentials.gist_github_api_access_token!)).call

    @gist = current_user.gists.create(question: @test_passage.current_question, url: result[:html_url])

    flash_options = if result.present?
                      { notice: t('.success', url: @gist.url) }
                    else
                      { alert: t('.failure') }
                    end
    redirect_to test_passage_path(@test_passage), flash_options
  end




  private

  def set_test_passage
  	@test_passage = TestPassage.find(params[:id])
  end

end
