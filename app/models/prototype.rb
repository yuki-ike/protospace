class Prototype < ActiveRecord::Base

  has_many :contents
  accepts_nested_attributes_for :contents, reject_if: :all_blank
  belongs_to :user

  def content_main
    if contents.main.present?
      contents.main[0].content
    end
  end

end
