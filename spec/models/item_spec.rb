require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should have_many :customer_items}
    it { should have_many(:customers).through(:customer_items)}
  end

  describe 'Instance Methods' do
    describe '#customer_count' do
      it 'Can return the number of customers belonging to the item' do
        customer_1 = Customer.create!(name: "Bob Smith")
        customer_2 = Customer.create!(name: "Akhil Grover")
        supermarket = Supermarket.create!(name: "Corner Market", location: "123 Food St.")
        item_1 = supermarket.items.create!(name: "Banana", price: 1)
        item_2 = supermarket.items.create!(name: "Toothpaste", price: 3)
        item_3 = supermarket.items.create!(name: "Rice", price: 7)
        CustomerItem.create!(customer: customer_1, item: item_1)
        CustomerItem.create!(customer: customer_1, item: item_2)
        CustomerItem.create!(customer: customer_2, item: item_2)

        expect(item_1.customer_count).to eq(1)
        expect(item_2.customer_count).to eq(2)
        expect(item_3.customer_count).to eq(0)
      end
    end
  end
end
