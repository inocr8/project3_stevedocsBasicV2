class Search < ActiveRecord::Base
  belongs_to :user
  belongs_to :document
  belongs_to :category
  belongs_to :language
  belongs_to :library
end
