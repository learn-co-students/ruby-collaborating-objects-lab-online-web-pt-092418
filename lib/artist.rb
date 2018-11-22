class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

def add_song(song)
  self.songs << song
end

def save
@@all << self
end

def self.all
  @@all
end

def self.create(name)
    artist = self.new(name)
    artist.save
    artist
end

def self.find_by_name(artist_name)
    self.all.find {|x| x.name == artist_name}
end

def self.find_or_create_by_name(artist_name)
  find_by_name(artist_name) || create(artist_name)
end

def print_songs
  @songs.each {|song| puts song.name}
end

end
