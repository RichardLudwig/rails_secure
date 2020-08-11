class Article < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, :content, :image, presence: true
end
