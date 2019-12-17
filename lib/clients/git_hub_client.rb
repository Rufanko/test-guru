class GitHubClient

  ROOT_ENDPOINT = 'https://api.github.com'
  ACCES_TOKEN = '15ccf4b95142d64b636cda27e701a8953afc48ba'

  def initialize
    @http_client = setup_http_client
  end

  def create_gists(params)
    @http_client.post('gists', params) do |request|
      request.headers['Authorization'] = "token #{ACCES_TOKEN}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end

end
