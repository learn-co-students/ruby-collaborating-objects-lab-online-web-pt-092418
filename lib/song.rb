class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end
  def self.new_by_filename(fname)
    song = Song.new(fname.split(" - ")[1]) # Splitting the file and setting the new song name
    artist = Artist.find_or_create_by_name(fname.split(" - ")[0]) # Creating or finding an artist based on fname
    artist.add_song(song) # Telling the artist about this song
    song.artist = artist # Telling the song about its artist
    song
  end
end
