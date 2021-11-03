require 'rails_helper'

describe 'Customers Controller', type: :request do
  describe 'GET /api/v1/customers/:id', :vrc do

    let(:headers) do
      {
        'CONTENT_TYPE' => 'application/json',
        'ACCEPT' => 'application/json',
      }
    end
    it 'adds tea to customers subscription' do
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
                                        status: 0,
                                        frequency: 0
                                        )
      get "/api/v1/customers/#{new_customer.id}", headers: headers
      customer = JSON.parse(response.body, symbolize_names: true)
    end

  end
end
