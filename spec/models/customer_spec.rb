require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'relationships' do
    it { should have_many :customer_items }
    it { should have_many(:items).through(:customer_items) }
  end

  describe 'Instance Methods' do
    describe '#add_item' do
      it 'Can add an item to the customer' do
        customer = Customer.create!(name: "Bob Smith")
        supermarket = Supermarket.create!(name: "Corner Market", location: "123 Food St.")
        item_1 = supermarket.items.create!(name: "Banana", price: 1)
        item_2 = supermarket.items.create!(name: "Toothpaste", price: 3)
        expect(customer.items).to eq([])
        customer.add_item(item_1)
        # require "pry"; binding.pry
        # not sure what is going on here, requires a .reload to update the customer.items
        expect(customer.reload.items).to eq([item_1])
        # require "pry"; binding.pry
      end
    end
  end
end
