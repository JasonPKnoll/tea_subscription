require 'rails_helper'

describe 'Subscriptions Controller', type: :request do
  describe 'POST /api/v1/subscription', :vrc do
    let(:params) do
      {
        customer: "1",
        tea: 'green',
        title: 'something',
        price: 10.00,
        status: 0,
        frequency: 0,
      }
    end

    let(:headers) do
      {
        'CONTENT_TYPE' => 'application/json',
        'ACCEPT' => 'application/json',
      }
    end
    it 'adds tea to customers subscription' do
      new_customer = create(:customer)
      new_tea = create(:tea, title: "green")

      post '/api/v1/subscriptions', params: params.to_json, headers: headers
      customer = JSON.parse(response.body, symbolize_names: true)
      expect(customer[:data]).to have_key(:id)
      expect(customer[:data]).to have_key(:type)
      expect(customer[:data]).to have_key(:attributes)

      expect(customer[:data][:attributes]).to have_key(:title)
      expect(customer[:data][:attributes][:title]).to eq(params[:title])

      expect(customer[:data][:attributes]).to have_key(:price)
      expect(customer[:data][:attributes][:price]).to eq(params[:price])

      expect(customer[:data][:attributes]).to have_key(:status)
      expect(customer[:data][:attributes][:status]).to eq('active')

      expect(customer[:data][:attributes]).to have_key(:frequency)
      expect(customer[:data][:attributes][:frequency]).to eq('monthly')

    end

    it 'renders 404 when no tea found' do
      new_customer = create(:customer, id: 1)

      post '/api/v1/subscriptions', params: params.to_json, headers: headers
      expect(response.status).to eq(404)
    end
  end

