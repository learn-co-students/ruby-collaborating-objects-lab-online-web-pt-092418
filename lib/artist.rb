class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song (song)
    self.songs << song
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.finds(aname)
    self.all.find{|artist| artist.name == aname}
  end

  def self.create (aname)
    artist = Artist.new(aname)
    artist.save
    artist
  end

  def self.find_or_create_by_name (aname)
    self.finds(aname) || self.create(aname)
  end

  def print_songs
    self.songs.each{|song| puts song.name}
  end
end
