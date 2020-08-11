class Article < ApplicationRecord
  belongs_to :user, optional: true

  validates_presence_of :title, :content, :image

  has_rich_text :content

  def to_param	
    "#{id} #{title}".parameterize	
  end  
end
