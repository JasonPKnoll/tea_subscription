class AddSubscriptionToTeas < ActiveRecord::Migration[6.1]
  def change
    add_reference :teas, :subscription, foreign_key: true
  end
end
