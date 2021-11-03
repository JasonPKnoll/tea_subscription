class Api::V1::SubscriptionsController < ApplicationController

  def create
    customer = Customer.find_by_id(params[:customer])
    @tea = Tea.find_by(title: params[:tea])
    if customer.present? && @tea.present?
      subscription = customer.subscriptions.create(subscription_params)
      render json: SubscriptionSerializer.new(subscription), status: 201
    else
      render json: {:error => 'Record not found'}, status: 404
    end
  end

  def destroy
    customer = Customer.find_by_id(params[:customer])
    subscription = customer.subscriptions.find_by_id(params[:id])
    subscription.destroy
    render json: {}, status: 204
  end

  private
  def subscription_params
    params.require(:subscription).permit(:title, :price, :status, :frequency).merge(tea_id: @tea.id)
  end

end
