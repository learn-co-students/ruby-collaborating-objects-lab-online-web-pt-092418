require 'pry'

class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    songs.push(song)
  end

  def save
    @@all.push(self)
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    self.find(name) || self.create(name)
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def self.find(name)
    self.all.find {|artist| artist.name == name}
  end

  def print_songs
    self.songs.each {|song| puts song.name}
  end
end
