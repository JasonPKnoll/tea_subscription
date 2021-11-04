class Api::V1::CustomersController < ApplicationController

  def show
    customer = Customer.find_by_id(params[:id])
    render json: CustomerSerializer.new(customer), status: 200
  end


  private

  def customer_params
    params.permit(:first_name, :last_name, :email, :address)
  end

end
