require 'pry'
class Artist
  attr_accessor :name, :songs
  @@all = [] 

  def initialize(name)
    @name = name
    @songs = []
  end
   
  def self.all
    @@all
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
     @songs << song
  end

  def save
    self.class.all << self
    
  end

  def self.find_by_name(stg)
    self.all.find {|obj| obj.name == stg }
  end
  
  def self.create_by_name(name)
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end  
  
  def self.find_or_create_by_name(name)
    
    find_by_name(name) || create_by_name(name)  
    
  end

  def print_songs
   self.songs.each {|song| 
    puts song.name}
  end

end