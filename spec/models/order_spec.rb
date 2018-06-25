require 'rails_helper'

describe Order do
  context "testing validations" do

    it "is not valid without user id" do
      expedt(Order.new(user_id:nil)).not_to_be_valid
  end
end
