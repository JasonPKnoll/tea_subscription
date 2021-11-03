FactoryBot.define do
  factory :tea do
    title {Faker::Tea.variety}
    description {Faker::Tea.type}
    temperature {Faker::Number.within(range: 60.0..110.00)}
    brew_time {Faker::Number.within(range: 60..360)}
  end
end
