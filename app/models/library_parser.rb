require 'pry'
require_relative 'song'
require_relative 'artist'
require_relative 'genre'

class LibraryParser

  attr_accessor :artist

  def files
     entry_array = Dir.entries('db/data')
     files_array = []
     entry_array.select { |file| files_array << file if file =~ (/mp3/)}
     files_array
     end

     def parse_filename(filename)
       artist_split = filename.split(" - ")
       title_split = artist_split[1].split(" [")
       genre_split = title_split[1].split("].")
       artist = artist_split[0]
       title = title_split[0]
       genre = genre_split[0]
       [artist, title, genre]
     end

     def build_song(artist_name, title, genre_name)
       making_song = Song.new
       making_artist = Artist.new(artist_name)
       making_genre = Genre.new(genre_name)
       making_song.genre = making_genre
       making_artist.add_song(making_song)
       making_song
    end

    def call
      files.each do |file|
        parsed_filename = parse_filename(file)
        build_song(parsed_filename[0],parsed_filename[1],parsed_filename[2])
      end
    end
end
