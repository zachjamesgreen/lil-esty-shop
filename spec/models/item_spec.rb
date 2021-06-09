require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it {should belong_to(:merchant)}
    it {should have_many(:invoice_items)}
    it {should have_many(:invoices).through(:invoice_items)}
  end
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:unit_price) }
  end
  describe 'instance methods' do
    
    describe '#top_day' do
      it 'returns top selling date' do
        merchant = Merchant.find(1)
        item = merchant.top_five_items.first

        expect(item.top_day).is_a? Date
      end
    end
  end
end
