class Song
  attr_accessor :name, :artist
 
  def initialize(name)
    @name = name
  end
 
  def artist=(artist)
    @artist = artist
  end

  def self.new_by_filename(filename)
    new_string = filename.split(" - ")
    artist_string = new_string[0]
    artist_object = Artist.find_or_create_by_name(artist_string)
    new_song = new_string[1]
    song_object = self.new(new_song)
    song_object.artist = artist_object
    artist_object.songs << song_object
    song_object
  end
end