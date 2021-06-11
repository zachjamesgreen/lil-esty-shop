# frozen_string_literal: true

class RepoCommits
  def initialize
    @ids = [77_814_101]
    @hash_array = GithubService.retrieve_stats
  end

  def list_commits
    user_commits = {}
    @hash_array.map do |hash|
      user_commits[hash['login']] = hash['contributions'] if @ids.include?(hash['id'].to_i)
    end
    user_commits
  end
end
