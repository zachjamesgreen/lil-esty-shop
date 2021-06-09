require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'validations' do
    it {should have_many(:items)}
  end

  describe 'class methods' do
    describe '#top_5_merchants' do
      it 'returns the top 5 merchants by revenue' do
        nicol = Merchant.find 5
        tad = Merchant.find 4
        chi = Merchant.find 2
        nina = Merchant.find 1
        theo = Merchant.find 3
        #raven = Merchant.find 5
        #galina = Merchant.find 1
        #evia = Merchant.find 3
        #cole = Merchant.find 2
        #berry = Merchant.find 4
        #merchants = Merchant.top_5_merchants

        expect(merchants).to eq [nicol, tad, chi, nina, theo]
      end
    end
  end

  describe 'instance methods' do
    before :each do
      @merchant_1 = Merchant.find(1)
      @merchant_2 = Merchant.find(2)
      @items_1 = @merchant_1.items
      @items_2 = @merchant_2.items

    end

    describe '#top_five' do
      it 'returns the top five revenue generating items' do
        item_5 = Item.find 5
        item_4 = Item.find 4
        item_3 = Item.find 3
        item_2 = Item.find 2
        item_1 = Item.find 1
        expect(@merchant_1.top_five_items).to eq([item_5, item_4, item_1, item_3, item_2])
      end
    end

    describe '#top_day' do
      it 'returns the topday by revenue for a merchant' do
        nicol = Merchant.find 5
        top_day = nicol.top_day.first.created_at
        print top_day.class
        
        #raven = Merchant.find 5
        #top_day = raven.top_day.first.created_at
        
        expect(top_day).to be_instance_of(ActiveSupport::TimeWithZone)
      end
    end
  end
end
