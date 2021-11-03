class SubscriptionSerializer
  include FastJsonapi::ObjectSerializer

  set_type 'subscriptions'
  attributes :title, :price, :status, :frequency

end
