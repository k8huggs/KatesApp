require 'rails_helper'

describe Product do

  context "when the product has comments" do
    let(:product) { Product.create!(name: "30 Minute GAWA", description: "Absolutely life-changing session. Get the coaching to set you on a new trajectory.", image_url: "app/assets/images/grammy.jpg", colour: "Glorious", price: "120.00")}
    let(:user) {User.create!(email: "test@test.com", password: "test123")}

  before do
    product.comments.create!(rating: 1, user: user, body: "Awfull Session")
    product.comments.create!(rating: 3, user: user, body: "OK Session")
    product.comments.create!(rating: 5, user: user, body: "Great Session")
  end

    it "returns the average rating off all comments" do
      expect(product.average_rating).to eq 3
    end

    it "is not valid without a name" do
      expect(Product.new(description: "Great Session")).not_to be_valid
    end
  end
end
