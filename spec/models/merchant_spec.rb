require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'validations' do
    it {should have_many(:items)}
  end

  describe 'class methods' do
    describe '#top_5_merchants' do
      it 'returns the top 5 merchants by revenue' do
        raven = Merchant.find 15
        galina = Merchant.find 31
        evia = Merchant.find 13
        cole = Merchant.find 35
        berry = Merchant.find 12
        merchants = Merchant.top_5_merchants

        expect(merchants).to eq [raven,galina,evia,cole,berry]
      end
    end
  end

  describe 'instance methods' do
    before :each do
      @merchant = Merchant.create!(name: 'Sweaters n Things')
      @customer = Customer.create!(first_name: 'Bill', last_name: 'Haynes')
      @invoice_1 = @customer.invoices.create!(status: 2, customer_id: @customer.id)
      @invoice_2 = @customer.invoices.create!(status: 1, customer_id: @customer.id)
      @invoice_3 = @customer.invoices.create!(status: 0, customer_id: @customer.id)
      @item_1 = @merchant.items.create!(name: 'Alpaca Sweater', description: 'Warm and Fuzzy', unit_price: 0.75107e5, merchant_id: @merchant.id)
      @item_2 = @merchant.items.create!(name: 'Wool Sweater', description: 'Warm and Scratchy', unit_price: 0.5107e5, merchant_id: @merchant.id)
      @item_3 = @merchant.items.create!(name: 'Cotton Sweater', description: 'Cool and Fuzzy', unit_price: 0.17e5, merchant_id: @merchant.id)
      @item_4 = @merchant.items.create!(name: 'Denim Sweater', description: 'Cool and Scratchy', unit_price: 0.7510e5, merchant_id: @merchant.id)
      @item_5 = @merchant.items.create!(name: 'Leather Sweater', description: 'Warm and Sweaty', unit_price: 0.75e5, merchant_id: @merchant.id)
      @item_6 = @merchant.items.create!(name: 'Suede Sweater', description: 'Cool and Sweaty', unit_price: 0.7522e5, merchant_id: @merchant.id)
      @item_7 = @merchant.items.create!(name: 'Polyester Sweater', description: 'Cool and Noisy', unit_price: 0.1234e5, merchant_id: @merchant.id)
      @invoice_item_1 = InvoiceItem.create!(item_id:@item_1.id, invoice_id:@invoice_1.id, quantity: 24, unit_price: @item_1.unit_price, status: 2)
      @invoice_item_2 = InvoiceItem.create!(item_id:@item_2.id, invoice_id:@invoice_1.id, quantity: 1, unit_price: @item_1.unit_price, status: 2)
      @invoice_item_3 = InvoiceItem.create!(item_id:@item_3.id, invoice_id:@invoice_2.id, quantity: 2, unit_price: @item_1.unit_price, status: 2)
      @invoice_item_4 = InvoiceItem.create!(item_id:@item_4.id, invoice_id:@invoice_2.id, quantity: 3, unit_price: @item_1.unit_price, status: 0)
      @invoice_item_5 = InvoiceItem.create!(item_id:@item_5.id, invoice_id:@invoice_3.id, quantity: 4, unit_price: @item_1.unit_price, status: 1)
      @invoice_item_6 = InvoiceItem.create!(item_id:@item_6.id, invoice_id:@invoice_3.id, quantity: 5, unit_price: @item_1.unit_price, status: 2)
      @invoice_item_7 = InvoiceItem.create!(item_id:@item_7.id, invoice_id:@invoice_1.id, quantity: 6, unit_price: @item_1.unit_price, status: 0)
      @transaction_2 = @invoice_2.transactions.create!(invoice_id: @invoice_2.id, credit_card_number:'234456778901', credit_card_expiration_date: '02/08', result: 2)
      @transaction_3 = @invoice_3.transactions.create!(invoice_id: @invoice_3.id, credit_card_number:'012344567789', credit_card_expiration_date: '03/09', result: 2)
    end

    describe '#top_five' do
      it 'returns the top five revenue generating items' do
        @transaction_1 = @invoice_1.transactions.create!(invoice_id: @invoice_1.id, credit_card_number:'123445677890', credit_card_expiration_date: '02/07', result: 2) 
        expect(@merchant.top_five).to eq([@item_1,@item_7,@item_6,@item_5,@item_4])
      end

      it 'does not return items with failed transactions' do
        @transaction_1 = @invoice_1.transactions.create!(invoice_id: @invoice_1.id, credit_card_number:'123445677890', credit_card_expiration_date: '02/07', result: 1)
        expect(@merchant.top_five.length).to eq 4
        expect(@merchant.top_five).to eq([@item_6, @item_5, @item_4, @item_3])
      end
    end

    describe '#top_day' do
      it 'returns the topday by revenue for a merchant' do
        raven = Merchant.find 15
        top_day = raven.top_day.first.created_at
        print top_day.class
        expect(top_day).to be_instance_of(ActiveSupport::TimeWithZone)
      end
    end
  end
end
