class Article < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, :content, :image, presence: true

  validates_uniqueness_of :search, presence: true, :case_sensitive => false
end
