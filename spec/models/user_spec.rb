require 'rails_helper'

describe User do
  describe '#create' do


    let(:params) { { username: 'yuki', email: 'yuki@hoge.com', password: '00000000', password_confirmation: '00000000' } }

    it "is valid with all information" do
      user = build(:user)
       expect(user).to be_valid
    end

    it "is invalid without an email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end


    it "is invalid with a duplicate email address" do
      user = create(:user, email: 'yuki@hoge.com' )
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

end
end