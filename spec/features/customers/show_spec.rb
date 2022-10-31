require 'rails_helper'

RSpec.describe 'Customer show page' do
  it "displays the customer's name" do
    customer = Customer.create!(name: "Bob Smith")

    visit "/customers/#{customer.id}"

    expect(page).to have_content(customer.name)
  end
  it "displays the list of its items" do
    customer = Customer.create!(name: "Bob Smith")
    supermarket = Supermarket.create!(name: "Corner Market", location: "123 Food St.")
    item_1 = supermarket.items.create!(name: "Banana", price: 1)
    item_2 = supermarket.items.create!(name: "Toothpaste", price: 3)
    item_3 = supermarket.items.create!(name: "Rice", price: 7)

    CustomerItem.create!(customer: customer, item: item_1)
    CustomerItem.create!(customer: customer, item: item_2)

    visit "/customers/#{customer.id}"

    within("#item-#{item_1.id}") do
      expect(page).to have_content(item_1.name)
      expect(page).to have_content(item_1.price)
      expect(page).to have_content(item_1.supermarket.name)
    end

    within("#item-#{item_2.id}") do
      expect(page).to have_content(item_2.name)
      expect(page).to have_content(item_2.price)
      expect(page).to have_content(item_2.supermarket.name)
    end

    # save_and_open_page
  end
end
