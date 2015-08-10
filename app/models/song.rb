require 'pry'
#if a song is added with a genre, add it to an array of that genres song
require_relative 'genre'
require_relative 'artist'


class Song
  # code here
  attr_accessor :name, :artist, :genre

      @@songs = []

  def initialize(name=nil)
    @name = name
    @@songs << self
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    genre.songs = [] unless genre.songs
    genre.songs << self
  end

  def to_s
    "#{self.artist.name} - #{self.name} [#{self.genre.name}]"
  end

  def self.all
     @@songs
  end

 def self.reset_all
   @@songs = []
 end

 def self.count
   @@songs.length
 end

 def self.find_by_name(name)
   @@songs.each { |object| return object if object.name = name }
 end

 def self.create_by_name(name)
   Song.new(name)
 end
end
