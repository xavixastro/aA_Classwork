# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  artwork_id :integer          not null
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord

  belongs_to :author, 
  foreign_key: :user_id, 
  class_name: :User 

  belongs_to :artwork, 
  foreign_key: :artwork_id, 
  class_name: :Artwork 

  has_many :likes, 
  as: :likeable 





  validates :user_id, :artwork_id, :body, presence: true 
end
