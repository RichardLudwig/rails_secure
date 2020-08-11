class Article < ApplicationRecord
  belongs_to :user, optional: true

  validates_presence_of :title, :content, :image

  def to_param	
    "#{id} #{title}".parameterize	
  end  
end
