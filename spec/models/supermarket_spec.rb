require 'rails_helper'

RSpec.describe Supermarket, type: :model do
  describe 'relationships' do
    it { should have_many :items }
  end

  describe 'Instance Methods' do
    describe '#list_customers' do
      it "lists all customers that have shopped at the supermarket" do
        customer_1 = Customer.create!(name: "Bob Smith")
        customer_2 = Customer.create!(name: "Akhil Grover")
        customer_3 = Customer.create!(name: "Dustin Finn")
        customer_4 = Customer.create!(name: "Willson Contreras")
        supermarket_1 = Supermarket.create!(name: "Corner Market", location: "123 Food St.")
        supermarket_2 = Supermarket.create!(name: "Mario Mart", location: "123 Rainbow Rd.")
        item_1 = supermarket_1.items.create!(name: "Banana", price: 1)
        item_2 = supermarket_1.items.create!(name: "Toothpaste", price: 3)
        item_3 = supermarket_1.items.create!(name: "Rice", price: 7)
        item_4 = supermarket_2.items.create!(name: "Beans", price: 3)
        CustomerItem.create!(customer: customer_1, item: item_1)
        CustomerItem.create!(customer: customer_1, item: item_3)
        CustomerItem.create!(customer: customer_2, item: item_2)
        CustomerItem.create!(customer: customer_3, item: item_4)
        CustomerItem.create!(customer: customer_4, item: item_2)
        # require "pry"; binding.pry
        expect(supermarket_1.list_customers).to eq([customer_1, customer_2, customer_4])
      end
    end
  end
end
