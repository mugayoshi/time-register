require 'rails_helper'

describe UsersController do
  describe 'GET #show' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :show, id: user
      expect(assigns(:user)).to eq user
    end
  end
  
  describe 'POST #create' do
    context "when @user is saved" do
      it "record is saved in DB" do
        expect do
          post :create, params: {user: attributes_for(:user)}
        end.to change(User, :count).by(1)
      end
      it "redirects to @user" do
        post :create, params: {user: attributes_for(:user)}
        expect(response).to redirect_to (user_path(assigns(:user)))
      end
    end
    
    context "when @user isn't saved" do
      it "record isn't saved in DB" do
        expect do
          post :create, params: {user: attributes_for(:user, name: nil)}
        end.to change(User, :count).by(0)
      end
    end
  end
  
  
end