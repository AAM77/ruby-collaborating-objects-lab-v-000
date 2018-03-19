class Artist
  @@all = []
  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song_name)
    @songs << song_name
  end

  def add_song_by_name(song_name)
    @song = Song.new(song_name)
    @song.artist = self
    @songs << @song
  end

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def self.find_or_create_by_name(name)
    self.find(name) ? self.find(name) : self.create(name)
  end

  def self.find(name)
    self.all.find {|artist| artist.name == name }
  end


  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end

  def save
    @@all << self
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end
end
