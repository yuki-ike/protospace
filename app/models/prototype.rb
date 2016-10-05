class Prototype < ActiveRecord::Base

  has_many :contents
  accepts_nested_attributes_for :contents, allow_destroy: true, reject_if: :has_content?
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  validates :title, presence: true
  validates :concept, presence: true
  validates :catch_copy, presence: true


  def content_main
    if contents.main.present?
      contents.main[0].content
    end
  end

  def has_content?(attributes)
    attributes['content'].blank?
  end

end
