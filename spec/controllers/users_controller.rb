require 'rails_helper'

describe UsersController type: :controller do
  let(:user) {User.create!(email: "random@email.com", first_name: "User", last_name: "random", admin: false, password: "Yellow123")}

  # describe 'GET #index' do
  #   it 'renders users index template' do
  #     get :index
  #     expect(response).to be_ok
  #     expect(response).to render_template('index')
  #   end
  # end

  describe 'Get #show' do

    context 'when a user is logged in' do
      before do
        sign_in :user
      end
      it 'loads correct user details' do
        get :show, params: { id: @user.id }
        expect(assigns(:user)).to eq @user
        expect(response).to have_http_status(200)
      end
    end

    context 'when a user is not logged in' do
      it 'redirects to login' do
        get :show, params: { id: user.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

end
