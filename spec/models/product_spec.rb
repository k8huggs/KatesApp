require 'rails_helper'

describe Product do

let(:product) { Product.create!(name: "30 Minute Midgrade")}

let(:user) {User.create!(email: "random@email.com", first_name: "User", last_name: "random", admin: false, password: "Yellow123")}
  before do
    product.comments.create!(rating: 1, user: user, body: "Bad Session")
    product.comments.create!(rating: 3, user: user, body: "Ok Session")
    product comments.create!(rating: 5, user: user, body: "Great Session!")
  end

  it "returns the average rating of all comments" do
    expect(product.average_rating).to eq 3
  end

  it "is not valid without a name" do
    expect(Product.new(description: "Cool Session")).not_to_be_valid
  end

end
