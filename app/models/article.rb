class Article < ApplicationRecord
  belongs_to :user, optional: true

  extend FriendlyId
  friendly_id :title, :use => [:finders]
  validates_presence_of :title, :slug, :content, :image
end
