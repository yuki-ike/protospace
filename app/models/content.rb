class Content < ActiveRecord::Base

  belongs_to :prototype

  mount_uploader :content, ContentUploader

  enum status: { main: 1, sub: 2 }

end
