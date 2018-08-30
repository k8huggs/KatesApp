FactoryBot.define do
  sequence(:email) {|n| "user#{n}@gmail.com"}

  factory :user, class: User do
    email
    password "testpassword"
    first_name "Jane"
    last_name "Jones"
    admin false
  end

  factory :admin, class: User do
    email "admin@example.de"
    password "testpassword"
    first_name "real"
    last_name "admin"
    admin true
  end

end
