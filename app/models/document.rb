class Document < ActiveRecord::Base
  belongs_to :category
  belongs_to :language

  has_many :libraries
  has_many :users, through: :libraries
  has_many :comments

  mount_uploader :document_image, DocumentImageUploader

  validates :name, :short, :tags, :content, :category_id, :language_id, presence: true
end
