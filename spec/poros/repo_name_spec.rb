require 'rails_helper'

describe RepoName do
  before :each do
    @github_data = {
      "id": 373926639,
      "node_id": "MDEwOlJlcG9zaXRvcnkzNzM5MjY2Mzk=",
      "name": "lil-esty-shop",
      "full_name": "zachjamesgreen/lil-esty-shop",
      "private": false,
      "owner": {
      "login": "zachjamesgreen",
      "id": 7896916,
      "node_id": "MDQ6VXNlcjc4OTY5MTY=",
      "avatar_url": "https://avatars.githubusercontent.com/u/7896916?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/zachjamesgreen",
      "html_url": "https://github.com/zachjamesgreen",
      "followers_url": "https://api.github.com/users/zachjamesgreen/followers",
      "following_url": "https://api.github.com/users/zachjamesgreen/following{/other_user}",
      "gists_url": "https://api.github.com/users/zachjamesgreen/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/zachjamesgreen/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/zachjamesgreen/subscriptions",
      "organizations_url": "https://api.github.com/users/zachjamesgreen/orgs",
      "repos_url": "https://api.github.com/users/zachjamesgreen/repos",
      "events_url": "https://api.github.com/users/zachjamesgreen/events{/privacy}",
      "received_events_url": "https://api.github.com/users/zachjamesgreen/received_events",
      "type": "User",
      "site_admin": false
      },
      "html_url": "https://github.com/zachjamesgreen/lil-esty-shop",
      "description": nil,
      "fork": false,
      "url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop",
      "forks_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/forks",
      "keys_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/keys{/key_id}",
      "collaborators_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/collaborators{/collaborator}",
      "teams_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/teams",
      "hooks_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/hooks",
      "issue_events_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/issues/events{/number}",
      "events_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/events",
      "assignees_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/assignees{/user}",
      "branches_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/branches{/branch}",
      "tags_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/tags",
      "blobs_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/git/blobs{/sha}",
      "git_tags_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/git/tags{/sha}",
      "git_refs_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/git/refs{/sha}",
      "trees_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/git/trees{/sha}",
      "statuses_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/statuses/{sha}",
      "languages_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/languages",
      "stargazers_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/stargazers",
      "contributors_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/contributors",
      "subscribers_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/subscribers",
      "subscription_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/subscription",
      "commits_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/commits{/sha}",
      "git_commits_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/git/commits{/sha}",
      "comments_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/comments{/number}",
      "issue_comment_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/issues/comments{/number}",
      "contents_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/contents/{+path}",
      "compare_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/compare/{base}...{head}",
      "merges_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/merges",
      "archive_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/{archive_format}{/ref}",
      "downloads_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/downloads",
      "issues_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/issues{/number}",
      "pulls_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/pulls{/number}",
      "milestones_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/milestones{/number}",
      "notifications_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/notifications{?since,all,participating}",
      "labels_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/labels{/name}",
      "releases_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/releases{/id}",
      "deployments_url": "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/deployments",
      "created_at": "2021-06-04T18:18:43Z",
      "updated_at": "2021-06-08T22:02:18Z",
      "pushed_at": "2021-06-08T22:38:21Z",
      "git_url": "git://github.com/zachjamesgreen/lil-esty-shop.git",
      "ssh_url": "git@github.com:zachjamesgreen/lil-esty-shop.git",
      "clone_url": "https://github.com/zachjamesgreen/lil-esty-shop.git",
      "svn_url": "https://github.com/zachjamesgreen/lil-esty-shop",
      "homepage": nil,
      "size": 2523,
      "stargazers_count": 1,
      "watchers_count": 1,
      "language": "Ruby",
      "has_issues": true,
      "has_projects": true,
      "has_downloads": true,
      "has_wiki": true,
      "has_pages": false,
      "forks_count": 0,
      "mirror_url": nil,
      "archived": false,
      "disabled": false,
      "open_issues_count": 19,
      "license": nil,
      "forks": 0,
      "open_issues": 19,
      "watchers": 1,
      "default_branch": "main",
      "temp_clone_token": nil,
      "network_count": 0,
      "subscribers_count": 3
      }
    class_double('GithubService', :retrieve_name => @github_data).as_stubbed_const
    @repo = RepoName.new
    @name = @repo.name
  end

  it 'returns a hash with the repo information' do
    expect(@repo.name).to eq('lil-esty-shop')
  end
end