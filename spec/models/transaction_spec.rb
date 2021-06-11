# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'validations' do
    it { should belong_to(:invoice) }
  end
end
