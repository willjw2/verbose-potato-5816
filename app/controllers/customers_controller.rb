class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @items = @customer.items
  end
  def update
    @customer = Customer.find(params[:id])
    item = Item.find(params[:item_id])
    @customer.add_item(item)
    redirect_to "/customers/#{@customer.id}"
  end
end
