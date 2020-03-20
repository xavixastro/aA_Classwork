# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create( 
  [{username: 'john'}, 
  {username: "taco"}, 
  {username: 'paco'}, 
  {username: 'steve'}]
  )

artworks = Artwork.create( 
  [{title: 'work_one', image_url: 'work_one.com', artist_id: 1},
  {title: 'work_two', image_url: 'work_two.com', artist_id: 1},
  {title: 'work_one', image_url: 'work_one.com', artist_id: 2},
  {title: 'work_four', image_url: 'work_four.com', artist_id: 3}]
  ) 

artwork_shares = ArtworkShare.create( 
  [{artwork_id: 1, viewer_id: 2},
  {artwork_id: 1, viewer_id: 4},
  {artwork_id: 2, viewer_id: 1},
  {artwork_id: 2, viewer_id: 4},
  {artwork_id: 4, viewer_id: 2}]
  )

