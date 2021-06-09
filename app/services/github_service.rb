class GithubService
  def self.retrieve_stats
    response = Faraday.get 'https://api.github.com/repos/zachjamesgreen/lil-esty-shop/contributors'
    body = response.body
    JSON.parse(body)
  end

  def self.retrieve_name
    response = Faraday.get 'https://api.github.com/repos/zachjamesgreen/lil-esty-shop'
    body = response.body
    JSON.parse(body#, symbolize_names: true)
  end
end