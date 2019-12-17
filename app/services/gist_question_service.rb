class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || GitHubClient.new
  end

  def call
    @client.create_gists(gist_params)
  end

  private

  def gist_params
    {
      "description": "A question about #{@test.title} from TestGuru",
      "files": {
        "test-guru-question.txt": {
          "content": gist_content
        }
      }
    }
  end

  def gist_content
    content  = [@question.content]
    content += @question.answers.pluck(:content)
    content.join("\n")
  end
end
