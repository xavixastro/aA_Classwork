# == Schema Information
#
# Table name: users
#
#  id       :bigint           not null, primary key
#  username :string           not null
#
class User < ApplicationRecord

  has_many :artworks, # atworks belongin to artist 
  foreign_key: :artist_id, 
  class_name: :Artwork 

  has_many :likes,  # things a viewer has shared 
  foreign_key: :viewer_id, 
  class_name: :ArtworkShare 

  has_many :shared_artworks, 
  through: :artworks, 
  source: :shares 





  validates :username, presence: true, uniqueness: true 
end
