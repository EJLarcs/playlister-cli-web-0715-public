require 'pry'
require_relative 'song'
require_relative 'genre'

class Artist
  # code here
  #attr_reader as genres
  attr_accessor :name, :song, :genres

      @@artists = []

  def initialize(name=nil)
    @name = name
    @@artists << self
    @songs = []
    @genres = []
  end

  def self.all
     @@artists
 end

 def self.reset_all
   @@artists = []
 end

 def self.count
   @@artists.length
 end

 def self.find_by_name(name)
   @@artists.each { |object| return object if object.name = name }
 end

 def self.create_by_name(name)
   Artist.new(name)
 end

 def add_songs(songs)
   songs.each { |song| @songs << song }
 end

 def add_song(song)
   @songs << song
   song.artist = self
    @genres << song.genre unless @genres.include?(song.genre)
   if song.genre
     song.genre.artists = [] unless song.genre.artists
     song.genre.artists << self unless song.genre.artists.include?(self)
   end

 end

 def songs
   @songs
 end

end

  #  genre_object.add_artist(self)
  #  binding.pry
   #if that song has a genre shouldnt that artist have a genre
