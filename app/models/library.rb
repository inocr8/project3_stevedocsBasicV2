class Library < ActiveRecord::Base
  belongs_to :user
  belongs_to :document

  validates :document_id, presence: true

end
