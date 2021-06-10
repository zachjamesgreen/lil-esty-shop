require 'rails_helper'

describe RepoName do
  before :each do
    @github_data = {
      "id": 373926639,
      "node_id": "MDEwOlJlcG9zaXRvcnkzNzM5MjY2Mzk=",
      "name": "lil-esty-shop"
      }
    class_double('GithubService', :retrieve_name => @github_data).as_stubbed_const
  end

  before(:each) do
    @github_data = {
      "id": 373926639,
      "node_id": "MDEwOlJlcG9zaXRvcnkzNzM5MjY2Mzk=",
      "name": "lil-esty-shop"}

    class_double('GithubService', :retrieve_name => @github_data).as_stubbed_const
  end
  it 'returns a hash with the repo information' do
    expect(RepoName.repo_name).to eq("123")
  end
end