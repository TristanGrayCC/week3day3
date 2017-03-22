require('pry')
require_relative('models/album')
require_relative('models/artist')

Album.delete_all
Artist.delete_all

########Every artist should have a name, and each album should have a name/title, genre and artist ID.
########Create and Save Artists

artist1 = Artist.new({'name' => 'Tristan'})
artist2 = Artist.new({'name' => 'Richard'})
artist3 = Artist.new({'name' => 'Lazy Bum'})

artist1.save
artist2.save
artist3.save

########Create and Save Albums

album1 = Album.new({'name' => 'Ham and Green Mushroom','genre' => 'Bizarro','artist_id'=>artist1.id})
album2 = Album.new({'name' => 'Dance to It','genre' => 'Cacophany','artist_id'=>artist1.id})
album3 = Album.new({'name' => 'North by North West','genre' => 'Chill Out','artist_id'=>artist2.id})
album4 = Album.new({'name' => 'How You Doing','genre' => 'Satire','artist_id'=>artist1.id})

album1.save
album2.save
album3.save
album4.save
album1.delete
# binding.pry

#########List All Artists/Albums

# print Artist.all().map{|artist|artist.name}
# print Album.all().map{|album|album.name}

#######List all the albums they have by an artist

# print artist1.albums

#########Show the artist any album belongs to

#print album3.artist

#########Edit Artists/Albums

# artist2.name = 'Jeremy'
# artist2.update
# print Artist.all().map{|artist|artist.name}

# album3.genre = 'Hip Hop'
# album3.update
# print Album.all().map{|album|album.genre}

#########Delete Artists/Albums

# album1.delete
# print Album.all().map{|album|album.name}
# artist3.delete
# print Artist.all().map{|artist|artist.name}
