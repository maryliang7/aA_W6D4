# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user1 = User.create(name: "mary", email: "mary@gmail.com")
# user2 = User.create(name: "charles", email: "charm@gmail.com")
User.destroy_all
5.times do
  User.create([{
    username: Faker::Name.first_name
  }])
end

Artwork.destroy_all
5.times do 
  Artwork.create([{
    title: Faker::Cannabis.strain,
    image_url: Faker::Avatar.image,
    artist_id: User.all.sample.id
  }])
end

ArtworkShare.destroy_all
10.times do
  ArtworkShare.create([{
    artwork_id: Artwork.all.sample.id,
    viewer_id: User.all.sample.id
  }])
end
Comment.destroy_all
10.times do
  Comment.create([{
    user_id: User.all.sample.id,
    artwork_id: Artwork.all.sample.id,
    body: Faker::Books::Lovecraft.sentence
  }])
end

