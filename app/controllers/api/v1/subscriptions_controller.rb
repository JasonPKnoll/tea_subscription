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
