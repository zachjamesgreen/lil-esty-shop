require 'rails_helper'

describe RepoCommits do
  before :each do
    @hash_array = [
      {"login"=>"zachjamesgreen",
      "id"=>7896916,
      "contributions"=>54},
      {"login"=>"BrianZanti",
      "id"=>8962411,
      "contributions"=>48},
      {"login"=>"NoahZinter",
      "id"=>77814101,
      "contributions"=>39},
      {"login"=>"timomitchel",
      "id"=>23040094,
      "contributions"=>9},
      {"login"=>"AlexKlick",
      "id"=>60951642,
      "contributions"=>90},
      {"login"=>"ztrokey",
      "id"=>20480167,
      "contributions"=>50}
    ]
    class_double('GithubService', :retrieve_stats => @hash_array).as_stubbed_const
    repo = RepoCommits.new
    @commits = repo.list_commits
  end

  it 'returns a hash of collaborators and their commit numbers' do
    require 'pry'; binding.pry
    expect(@commits).is_a? Hash
    expect(@commits).to have_key('NoahZinter')
    expect(@commits['NoahZinter']).to eq 39
    # binding.pry
  end

  it 'does not include excluded ids' do
    expect(@commits.keys.include?('BriainZanti')).to eq false
    expect(@commits.keys).to eq(['zachjamesgreen', 'NoahZinter', 'AlexKlick', 'ztrokey'])
  end

end