class AddSubscriptionToCustomer < ActiveRecord::Migration[6.1]
  def change
    add_reference :customers, :subscription, foreign_key: true
  end
end
