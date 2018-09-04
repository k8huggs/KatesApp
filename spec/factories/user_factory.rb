FactoryBot.define do
  sequence(:email) { |n| "test#{n}@example.com" }

  factory :user do
    email
    password "OneTwoThree4"
    first_name "Jane"
    last_name "Jones"
    admin false
  end

end
