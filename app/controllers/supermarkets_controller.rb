class SupermarketsController < ApplicationController
  def show
    @supermarket = Supermarket.find(params[:id])
    @customers = @supermarket.list_customers
    # require "pry"; binding.pry
  end
end
