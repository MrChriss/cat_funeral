class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:notice] = "#{@customer.name} created."
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :password)
  end
end
