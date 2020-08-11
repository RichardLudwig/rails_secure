class Article < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, :content, :image, presence: true

  validates_uniqueness_of :search, presence: true, :case_sensitive => false

  # def to_param
  #   "#{id} #{title}".parameterize
  # end  
  extend FriendlyId
  friendly_id :title, use: :slugged
end
