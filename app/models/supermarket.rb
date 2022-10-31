class Supermarket < ApplicationRecord
  has_many :items

  def list_customers
    # require "pry"; binding.pry
    Customer.joins(items: :supermarket).where(items: {supermarket_id: self.id}).distinct
  end
end
