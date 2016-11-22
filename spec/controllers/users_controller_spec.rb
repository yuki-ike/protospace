require 'rails_helper'

describe UsersController do

    describe 'GET #show' do
      let(:user){ create(:user) }

      it "assigns the requested to @user" do
        get :show, id: user.id
        expect(assigns(:user)).to eq(user)
      end

      it "renders the :show templates" do
       get :show, id: user.id
       expect(response).to render_template :show
      end

    describe 'GET #edit' do
      let(:user){ create(:user) }
      before :each do
        get :show, id: user.id
      end

      it "assigns the requested to @user" do
        expect(assigns(:user)).to eq(user)
      end

      it "renders the :edit templates" do
        get :edit, id: user.id
        expect(response).to render_template :edit
       end

    end
  end

      describe 'PUT #update' do
        before { sign_in create(:user) }

        context "with user login" do
          it "changes @user's attributes" do
            user = create(:user)
            patch :update, id: user.id,
            user: attributes_for(:user,
            username: 'ikeda')
            user.reload

            expect(user.username).to eq("ikeda")
          end
      end
    end

  end
