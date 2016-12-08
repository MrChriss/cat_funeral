class CustomersController < ApplicationController
  before_action :logged_in_customer, only: :index

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
      log_in(@customer)
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
