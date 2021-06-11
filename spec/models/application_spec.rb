# frozen_string_literal: true

require 'rails_helper'

describe 'formatted time' do
  it 'formats the time' do
    created_at_time = Customer.first
    expect(created_at_time.formatted_time).to eq('June 08, 2021')
  end
end
