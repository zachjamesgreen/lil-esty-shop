require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'validations' do
    it {should have_many(:invoices)}
  end

  describe 'class methods' do
    describe '#top_5_customers_by_transactions' do
      it 'gives the top 5 customers by transactions' do
        data = Customer.top_5_customers_by_transactions

        expect(data.map(&:first_name)).to match_array ['An', 'Dean', 'Lemuel', 'Lindsey', 'Vivan']
        expect(data.map(&:transaction_count)).to match_array [2, 3, 3, 3, 4]

      end
    end
  end
end
