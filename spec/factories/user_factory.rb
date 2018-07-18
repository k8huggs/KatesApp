FactoryBot.define do
  sequence(:email) {|n| "user#{n}@gmail.com"}

  factory :user do
    email
    password "whyohwhy123"
    first_name "Jane"
    last_name "Jones"
    admin false
  end

  factory :admin, class: User do
    email
    password "whyohwhy456"
    admin true
    first_name "Boss"
    last_name "Lady"
  end

end
