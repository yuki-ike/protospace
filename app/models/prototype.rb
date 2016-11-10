class Prototype < ActiveRecord::Base

  belongs_to :user

  has_many :contents
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :contents, allow_destroy: true, reject_if: :has_content?

  validates :title, :concept, :catch_copy, presence: true

  acts_as_taggable
  # acts_as_taggable_on :tags のエイリアス(prototype.tag_list)
  acts_as_ordered_taggable_on :prototypes

  paginates_per 8

  def content_main
    if contents.main.present?
      contents.main[0].content
    end
  end

  def content_sub
    if contents.sub.present?
      contents.sub
    end
  end

  def has_content?(attributes)
    attributes['content'].blank?
  end

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

end
