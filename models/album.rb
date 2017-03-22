require('pg')
require_relative('../db/sql_runner')

class Album

  attr_reader :id, :artist_id

  attr_accessor :name, :genre

  def initialize(options)
    @id = options['id'].to_i
    @name=options['name']
    @genre=options['genre']
    @artist_id=options['artist_id'].to_i
  end

  def save
    sql = "INSERT INTO albums (name, genre, artist_id)
    VALUES ('#{@name}', '#{@genre}', #{@artist_id})
    RETURNING *"
    result = SqlRunner.run(sql)
    @id = result.first()["id"].to_i
  end

  def delete
    sql = "DELETE FROM albums WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def update
    sql = "UPDATE albums SET (name, genre, artist_id) = ('#{@name}', '#{@genre}', #{@artist_id}) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def artist
    sql = "SELECT * FROM artists WHERE id = #{artist_id}"
    result = SqlRunner.run(sql)
    artists = result.map{|artist|Artist.new(artist)}
    return artists
  end

  def self.all
    sql = "SELECT * FROM albums"
    result = SqlRunner.run(sql)
    albums = result.map{|album|Album.new(album)}
    return albums
  end

  def self.delete_all
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

end
