class GithubService
  def self.retrieve_stats
    response = Faraday.get 'https://api.github.com/repos/noahzinter/bulk_discounts/contributors'
    body = response.body
    JSON.parse(body)
  end

  def self.retrieve_name
    response = Faraday.get 'https://api.github.com/repos/noahzinter/bulk_discounts'
    body = response.body
    JSON.parse(body, symbolize_names: true)
  end

  def self.retrieve_pulls
    res = Faraday.get 'https://api.github.com/repos/noahzinter/bulk_discounts/pulls?state=all'
    body = res.body
    h = JSON.parse(body).size
  end
end