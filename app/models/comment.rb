class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :document

  validates :user_id, :document_id, :content, presence: true
end
