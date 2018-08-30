FactoryBot.define do
  factory :user do
    first_name 'John'
    last_name  'Doe'
    admin false

    sequence(:name) { |n| "product#{n}" }
   	factory :product, class: Product do
    	name
    	description "30 Minute Midgrade"
    	price 45.00
    	color "Pretty beautiful"
    	image_url "app/assets/images/spotify.jpg"
    end
  end
end
