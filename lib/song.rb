require 'pry'

class Song

  attr_accessor :artist, :name

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file)
    file_split =  file.split(" - ")
    song_name = file_split[1]
    artist_name = file_split[0]

    song_inst = self.new(song_name)
    artist_inst = Artist.find_or_create_by_name(artist_name)

    song_inst.artist = artist_inst
    artist_inst.add_song(song_inst)

    song_inst
  end




end