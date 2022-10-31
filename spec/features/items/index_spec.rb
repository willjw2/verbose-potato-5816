require 'rails_helper'

RSpec.describe 'Items index page' do
  before :each do
    @customer_1 = Customer.create!(name: "Bob Smith")
    @customer_2 = Customer.create!(name: "Akhil Grover")
    @supermarket = Supermarket.create!(name: "Corner Market", location: "123 Food St.")
    @item_1 = @supermarket.items.create!(name: "Banana", price: 1)
    @item_2 = @supermarket.items.create!(name: "Toothpaste", price: 3)
    @item_3 = @supermarket.items.create!(name: "Rice", price: 7)
    CustomerItem.create!(customer: @customer_1, item: @item_1)
    CustomerItem.create!(customer: @customer_1, item: @item_2)
    CustomerItem.create!(customer: @customer_2, item: @item_2)
  end
  it "displays a list of all items and their attributes with a count of customers" do
    visit "/items"
    # save_and_open_page
    within("#item-#{@item_1.id}") do
      expect(page).to have_content(@item_1.name)
      expect(page).to have_content(@item_1.price)
      expect(page).to have_content(@item_1.supermarket.name)
      expect(page).to have_content("Customers: 1")
    end
    within("#item-#{@item_2.id}") do
      expect(page).to have_content(@item_2.name)
      expect(page).to have_content(@item_2.price)
      expect(page).to have_content(@item_2.supermarket.name)
      expect(page).to have_content("Customers: 2")
    end
    within("#item-#{@item_3.id}") do
      expect(page).to have_content(@item_3.name)
      expect(page).to have_content(@item_3.price)
      expect(page).to have_content(@item_3.supermarket.name)
      expect(page).to have_content("Customers: 0")
    end
  end
end
