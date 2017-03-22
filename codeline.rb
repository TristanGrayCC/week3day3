require('pry')
require_relative('models/album')
require_relative('models/artist')

album.delete_all
artist.delete_all

artist1 = artist.new({'name' => 'Tristan'})
artist2 = artist.new({'name' => 'Richard'})

artist1.save
artist2.save

album1 = Album.new({'name' => 'Ham and Green Mushroom','genre' => 'Bizarro','artist_id'=>artist1.id})
album2 = Album.new({'name' => 'Dance to It','genre' => 'Cacophany','artist_id'=>artist1.id})
album3 = Album.new({'name' => 'North by North West','genre' => 'Chill Out','artist_id'=>artist2.id})
album3 = Album.new({'name' => 'How You Doing','genre' => 'Satire','artist_id'=>artist1.id})

album1.save
album2.save
album3.save
album1.delete
# binding.pry

# print artist.all().map{|pizza|pizza.name}
# print Pizzaalbum.all().map{|pizza|pizza.id}

print album2.artist
# print artist1.pizza_albums
