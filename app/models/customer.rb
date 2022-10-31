class Customer < ApplicationRecord
  has_many :customer_items, dependent: :destroy
  has_many :items, through: :customer_items

  def add_item(item)
    CustomerItem.create!(customer: self, item: item)
  end
end
