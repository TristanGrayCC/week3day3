require('pg')
require_relative('../db/sql_runner')

class Artist

  attr_reader :id

  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i
    @name=options['name']
  end

  def save
    sql = "INSERT INTO artists (name)
    VALUES ('#{@name}')
    RETURNING *"
    result = SqlRunner.run(sql)
    @id = result.first()["id"].to_i
  end

  def delete
    sql = "DELETE FROM artists WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def update
    sql = "UPDATE artists SET (name) = ('#{@name}') WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def albums
    sql = "SELECT * FROM albums WHERE artist_id = #{@id}"
    result = SqlRunner.run(sql)
    albums= result.map{|album|Album.new(album)}
    return albums
  end

  def self.all
    sql = "SELECT * FROM artists"
    result = SqlRunner.run(sql)
    artists = result.map{|artist|Artist.new(artist)}
    return artists
  end

  def self.delete_all
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

end
