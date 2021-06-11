require 'rails_helper'

describe RepoName do
  it 'returns a hash with the repo information' do
    expect(RepoName.repo_name).to eq("bulk_discounts")
  end
end