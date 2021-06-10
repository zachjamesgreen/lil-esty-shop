class RepoName

  def self.repo_name
    github_data = GithubService.retrieve_name
    name = github_data[:name]
  end
end
