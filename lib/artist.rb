class Artist

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song_inst)
    @songs << song_inst
  end

  def save
    self.class.all << self
  end

  #self.class this will convert the class

  def self.all #class reader method
    @@all
  end

  def self.find_by_name(name)
    self.all.detect {|artist| artist.name == name }
  end

  def self.create_by_name(name)
    artist_inst = self.new(name)
    artist_inst.save
    artist_inst
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def print_songs
    @songs.each do |song_inst|
      puts song_inst.name
    end
  end


end


