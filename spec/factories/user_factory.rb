FactoryBot.define do
  sequence(:email) {|n| "user#{n}@gmail.com"}

  factory :user, class: User do
    email
    password "testpassword"
    first_name "Jane"
    last_name "Jones"
    admin false

  trait :admin do
    admin true
    end
  end
end
