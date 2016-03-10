class Language < ActiveRecord::Base
  has_many :documents
  has_many :categories, through: :documents

  mount_uploader :language_image, LanguageImageUploader

  validates :name, :colour, :description, presence: true
  validates :name, uniqueness: true
end
