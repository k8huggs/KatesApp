require 'rails_helper'

describe ProductsController, type: :controller do
  context 'unauthenticated user' do
    it 'cannot edit' do
      @product = FactoryBot.create(:test_product)
      get :edit, params:{id: @product.id}
      expect(response).to redirect_to(products_path)
      expect(flash[:notice]).to match("You need to be an Admin to perform this action!")
    end
  end
end
