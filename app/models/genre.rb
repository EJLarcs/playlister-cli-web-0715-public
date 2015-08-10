require 'pry'
require_relative 'song'
require_relative 'artist'

class Genre
  # code here
  attr_accessor :name, :artist, :songs, :artists

      @@genres = []

  def initialize(name=nil)
    @name = name
    @@genres << self
  end

  def self.all
     @@genres
  end

 def self.reset_all
   @@genres = []
 end

 def self.count
   @@genres.length
 end

 def self.find_by_name(name)
   @@genres.each { |object| return object if object.name = name }
 end

 def self.create_by_name(name)
   Genre.new(name)
 end


  def artists
    artists = []
    Artist.all.select { |artist|
      artists << artist if artist.genres.include?(self)
    }
    artists
  end


end



  # def songs
  #   songs = []
  #   Song.all.select { |song|
  #     songs << song if song.genre && song.genre.name == self.name
  #   }
  #   songs
  # end
