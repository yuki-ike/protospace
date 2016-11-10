require 'rails_helper'
describe Prototype do
  let(:params) { Prototype.create()}

  describe "DELETE #destroy" do
    it 'deletes the comments when prototype is deleted' do
    prototype = create(:prototype)
    comment =create(:comment, prototype: prototype)
    expect {
    prototype.destroy }.to change{Comment.count}.by(-1)
    end

    it 'deletes the likes when Prototype is deleted' do
    prototype = create(:prototype)
    like = create(:like, prototype: prototype)
    expect {
     prototype.destroy }.to change{Like.count}.by(-1)
   end
  end

  describe "validations" do
    it "is missing a title" do
      prototype = build(:prototype, title: nil)
      prototype.valid?
      expect(prototype.errors[:title]).to include("can't be blank")
    end

    it "is missing a catch_copy" do
      prototype = build(:prototype, catch_copy: nil)
      prototype.valid?
      expect(prototype.errors[:catch_copy]).to include("can't be blank")
    end

    it "is missing a concept" do
      prototype = build(:prototype, concept: nil)
      prototype.valid?
      expect(prototype.errors[:concept]).to include("can't be blank")
    end
  end

  describe "#liked_by(user)"
    it 'returns true' do
      user = create(:user)
      prototype = create(:prototype, user: user)
      like = create(:like, prototype: prototype, user: user)
      expect(prototype.like_user(user.id)).to eq(like)
    end

end




