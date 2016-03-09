class Category < ActiveRecord::Base
  has_many :documents
  has_many :languages, through: :documents

  mount_uploader :category_image, CategoryImageUploader

  validates :name, :colour, :description, presence: true
  validates :name, uniqueness: true

end
