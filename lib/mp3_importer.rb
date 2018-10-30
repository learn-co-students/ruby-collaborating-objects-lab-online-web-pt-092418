require 'pry'

class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    # returns all the files for songs in @path.
    # MP3Importer #files normalizes the filename to just the mp3 filename with no path
    # this is from the hot potato lab but I can't figure it out @files ||= Dir.glob("#{@path}/*.mp3").map{|file| file.gsub("#{@path}/","")}
    files = []
    Dir.new(self.path).each do |file|
      files << file if file.length > 4
    end
    files
  end

  def import()
    # MP3Importer #import imports the files into the library by creating songs from a filename
    self.files.each do |filename| Song.new_by_filename(filename)
    end
    # add this block to import something specific { |e| File.file? e }
  end
end
