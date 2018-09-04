require 'rails_helper'
describe CommentsController, type: :controller do
  context 'autehnticated user' do
    before(:each) do
      @user = FactoryBot.create(:test_user)
      sign_in @user
    end
    it "can add comments" do
      @product = FactoryBot.create(:test_product)
      @comment = FactoryBot.build(:test_comment, product_id: @product.id, user: @user )
      expect(@comment).to be_valid
     end
   end
end
