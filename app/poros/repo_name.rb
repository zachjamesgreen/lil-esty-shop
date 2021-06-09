class RepoName
  attr_reader :name

  def initialize
    @github_data = GithubService.retrieve_name
    @name = @github_data[:name]
  end
end