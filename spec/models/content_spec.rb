require 'rails_helper'

# RSpec.describe 'coordinate_upload', type: :request do
  # include RequestHelper
  include ActionDispatch::TestProcess

  describe "without content attribute" do
    it 'returns error' do
      content = build(:content, :main, content: nil)
      content.valid?
      expect(content.errors[:content]).to include("can't be blank")
    end

    it 'returns error' do
      content = build(:content, status: nil)
      content.valid?
      expect(content.errors[:status]).to include("can't be blank")
    end
  end
