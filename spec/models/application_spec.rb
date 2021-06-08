require 'rails_helper'

RSpec.describe ApplicationRecord, type: :model do

  describe 'class methods' do
    describe '#formatted_time' do
      let(:time_test) { Invoice.create(customer_id: Customer.first.id) } 
      it 'formats the time, ex: Monday, July 18, 2019' do     
        date = DateTime.now
        expect(time_test.formatted_time).to include(date.to_formatted_s(:long)[0..-7])
      end
    end
  end
end