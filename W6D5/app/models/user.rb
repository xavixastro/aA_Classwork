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
  class_name: :Artwork, 
  dependent: :destroy

  has_many :artwork_shares,  # things he is following or
  foreign_key: :viewer_id, 
  class_name: :ArtworkShare, 
  dependent: :destroy
  
  has_many :shared_artworks, # artworks that have been shared with user
  through: :artwork_shares, 
  source: :artwork

  has_many :comments, 
  foreign_key: :user_id, 
  class_name: :Comment, 
  dependent: :destroy 





  validates :username, presence: true, uniqueness: true 
end
