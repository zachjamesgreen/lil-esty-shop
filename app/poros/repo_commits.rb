class RepoCommits
  def initialize
    @ids = [7896916, 77814101, 20480167, 60951642]
    @hash_array = GithubService.retrieve_stats
  end

  def list_commits
    user_commits = Hash.new
    @hash_array.map do |hash|
      if @ids.include?(hash['id'].to_i)
        user_commits[hash["login"]] = hash["contributions"]
      end
    end
    user_commits
  end
end
