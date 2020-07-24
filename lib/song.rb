class Song
  attr_accessor :name, :artist

  def initialize(name, artist = nil)
    @name = name
    @artist = artist # Set the Artist of a song
  end
  def self.new_by_filename(fname)
    artist = Artist.find_or_create_by_name(fname.split(" - ")[0]) # Creating or finding an artist based on fname
    song = Song.new(fname.split(" - ")[1], artist) # Splitting the file and setting the new song name
    artist.add_song(song) # Telling the artist about this song
    song
  end
end
