require 'pry'

class Artist

  attr_accessor :name, :songs
  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    # #initialize with #name
    #accepts a name for the artist
    # #name= sets the artist name
    @songs = []
  end

  def add_song(song)
    songs << song #shovels a song into an array of artists songs
  end

  def save
    self.class.all << self  #.class refers to the class version of self and back to artist
  end

  def self.find(name)
    self.all.find {|artist| artist.name == name }
  end

  def self.create(name)
    artist_object = self.new(name)
    artist_object.save
    artist_object
  end

  def self.find_or_create_by_name(artist_name)
    self.find(artist_name)||self.create(artist_name)
  end

  def print_songs
    self.songs.each {|song| puts song.name}
  end
end
