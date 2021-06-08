class GithubService
  def self.retrieve_stats
    response = Faraday.get 'https://api.github.com/repos/zachjamesgreen/lil-esty-shop/contributors'
    body = response.body
    JSON.parse(body)
  end
end