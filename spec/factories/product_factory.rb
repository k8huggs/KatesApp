FactoryBot.define do
  sequence(:name) { |n| "product#{n}" }
  factory :product, class: Product do
    name
    description "30 Minute Midgrade"
    price 45.00
    color "Pretty beautiful"
    image_url "app/assets/images/spotify.jpg"
  end
end
