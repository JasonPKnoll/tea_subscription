require 'rails_helper'

describe 'Customers Controller', type: :request do
  describe 'GET /api/v1/customers/:id', :vrc do

    let(:headers) do
      {
        'CONTENT_TYPE' => 'application/json',
        'ACCEPT' => 'application/json',
      }
    end
    it 'get customer data with all subscriptions' do
      new_customer = create(:customer)
      new_tea = create(:tea, title: "green")
      new_tea_2 = create(:tea, title: "black")
      sub = new_customer.subscriptions.create(customer_id: new_customer.id,
                                        tea_id: new_tea.id,
                                        title: "green tea sub",
                                        price: 10.00,
                                        status: 0,
                                        frequency: 0
                                        )
      sub_2 = new_customer.subscriptions.create(customer_id: new_customer.id,
                                        tea_id: new_tea_2.id,
                                        title: "black tea sub",
                                        price: 10.00,
                                        status: 1,
                                        frequency: 0
                                        )
      get "/api/v1/customers/#{new_customer.id}", headers: headers
      customer = JSON.parse(response.body, symbolize_names: true)

      expect(customer[:data]).to have_key(:id)
      expect(customer[:data]).to have_key(:type)
      expect(customer[:data]).to have_key(:attributes)

      expect(customer[:data][:attributes]).to have_key(:first_name)
      expect(customer[:data][:attributes][:first_name]).to eq(new_customer.first_name)

      expect(customer[:data][:attributes]).to have_key(:last_name)
      expect(customer[:data][:attributes][:last_name]).to eq(new_customer.last_name)

      expect(customer[:data][:attributes]).to have_key(:email)
      expect(customer[:data][:attributes][:email]).to eq(new_customer.email)

      expect(customer[:data][:attributes]).to have_key(:address)
      expect(customer[:data][:attributes][:address]).to eq(new_customer.address)

      expect(customer[:data][:attributes]).to have_key(:subscriptions)
      expect(customer[:data][:attributes][:subscriptions].count).to eq(2)

      expect(customer[:data][:attributes][:subscriptions][0]).to have_key(:id)
      expect(customer[:data][:attributes][:subscriptions][0]).to have_key(:title)
      expect(customer[:data][:attributes][:subscriptions][0]).to have_key(:price)
      expect(customer[:data][:attributes][:subscriptions][0]).to have_key(:status)
      expect(customer[:data][:attributes][:subscriptions][0]).to have_key(:frequency)

      expect(customer[:data][:attributes][:subscriptions][0][:status]).to eq("active")
      expect(customer[:data][:attributes][:subscriptions][1][:status]).to eq("archived")

    end

  end
end
