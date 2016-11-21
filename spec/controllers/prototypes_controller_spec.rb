require 'rails_helper'

describe PrototypesController do

  describe 'GET #new' do
    it "reders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do

    context 'with the valid attribtues' do
      before { sign_in create(:user) }
      let(:prototype){ create(:prototype) }

      it 'saves the new prototype in the database' do
        expect{
          post :create, prototype: attributes_for(:prototype)
        }.to change(Prototype, :count).by(1)
      end

      it 'redirects to root_path' do
        post :create, prototype: attributes_for(:prototype)
        expect(response).to redirect_to root_path
      end

      it 'shows flash messages to show save the prototype successfully' do
        post :create, prototype: attributes_for(:prototype)
        expect(flash[:success]).not_to be_empty
      end
    end

  end


    context 'with invalid attribtues' do
      before { sign_in create(:user) }
      let(:prototype){ create(:prototype) }

      it 'does not saves the new prototype in the database' do
        expect{
          post :create, prototype: attributes_for(:prototype, title: nil)
        }.not_to change(Prototype, :count)
      end
    end


  describe 'GET #show' do
    let(:prototype) { create(:prototype) }
    it "assigns the requested to @prototype" do
      get :show, id: prototype
      expect(assigns(:prototype)).to eq prototype
      end

    it "assigns the requested to @comment" do
      prototype = build(:prototype)
      comment = create(:comment, prototype: prototype)
      get :show, id: prototype
      expect(response).to render_template :show
      end


    it "reders the :show template" do
      get :show, id: prototype
      expect(response).to render_template :show
      end
    end

  describe 'GET #edit' do
    let(:prototype) { create(:prototype) }
    it "assigns the requested to @prototype" do
      get :edit, id: prototype
      expect(assigns(:prototype)).to eq prototype
      end
      # OK

    it "assigns main_image to @main_image" do
      get :edit, id: prototype
      expect(assigns(:prototype)).to eq prototype
    end

    it "reders the :edit template" do
        get :edit, id:prototype
        expect(response).to render_template :edit
      end
  end


  describe 'PATCH #update' do
    context 'with invalid attribtues' do
      before do
        @prototype = Prototype.new( title: nil, concept: nil, catch_copy: nil)
      end

      it 'does not saves the new prototype' do
     @prototype.should_not be_valid
     end

    end
  end

  describe 'DELETE #destroy' do
    before { sign_in create(:user) }
    it 'deletes the prototype' do
      prototype = create(:prototype)
      expect{
        delete :destroy, id: prototype.id
      }.to change(Prototype, :count).by(-1)
    end

    it 'redirects to root_path' do
      prototype = create(:prototype)
      delete :destroy, id: prototype
      expect(response).to redirect_to(root_path)
    end
  end

end
