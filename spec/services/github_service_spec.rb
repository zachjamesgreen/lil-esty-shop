require 'rails_helper'

describe GithubService do
  it 'it returns an array of hashes' do
    expected = GithubService.retrieve_stats

    expect(expected).is_a? Array
    expect(expected.first).is_a? Hash
  end
end
