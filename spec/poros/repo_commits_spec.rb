require 'rails_helper'

describe RepoCommits do
  before(:each) do
    @commits = RepoCommits.new.list_commits
  end

  it 'returns a hash of collaborators and their commit numbers' do
    expect(@commits).is_a? Hash
    expect(@commits).to have_key('NoahZinter')
    expect(@commits['NoahZinter']).to eq 39
  end

  it 'does not include excluded ids' do
    expect(@commits.keys.include?('BriainZanti')).to eq false
    expect(@commits.keys).to eq(['NoahZinter'])
  end

end