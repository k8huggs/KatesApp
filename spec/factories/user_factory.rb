FactoryBot.define do
  factory :user do
    email { "jim_#{Time.now.to_f}@example.com" }
    password "OneTwoThree4"
    first_name "Jane"
    last_name "Jones"
    admin false
  end

end
