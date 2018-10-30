require 'pry'

class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name 
    @@all << self

  end

  def self.all
    @@all
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
    #finds or creates an artist by name maintaining uniqueness of objects by name property
    # Creates new instance of Artist if none exist

    artist.add_song(self)
  end

  def self.artist(artist_name)
    self.artist_name
    # we'll create a method that takes in the name and gets the artist object
  end

  def self.new_by_filename(filename)
    # binding.pry
    new_song_title = filename.chomp(".mp3").split(" - ")
    new_song = self.new(new_song_title[1])
    new_song.artist_name = new_song_title[0]
    new_song

    # it 'associates new song instance with the artist from the filename' do
    #   Artist.class_variable_set("@@all",[])
    #   new_instance = Song.new_by_filename(file_name)
    #   expect(new_instance.artist.name).to eq('Michael Jackson')
    #   expect(Artist.all.size).to eq(1)
    #   expect(Artist.all.first.songs.empty?).to eq(false)
    # end
  end

end
