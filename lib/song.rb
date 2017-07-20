class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new # creates new song
    song.save # uses save method to save to array
    song # returns new song
  end


  def self.new_by_name(new_name)
    new_song = self.new
    new_song.name = new_name
    new_song
  end


  def self.create_by_name(name)
    self.new_by_name(name).save
    self.all.last
  end


  def self.find_by_name(name)
    self.all.find{|p| p.name == name}
  end


  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end


  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    song_info = filename[0...-4].split(" - ")
    new_song = self.create_by_name(song_info[1])
    new_song.artist_name = song_info[0]
    new_song
  end


  def self.create_from_filename(filename)
    song_info = filename[0...-4].split(" - ")
    new_song = self.create_by_name(song_info[1])
    new_song.artist_name = song_info[0]
    new_song
  end

  def self.destroy_all
    self.all.clear
  end


  def self.all
    @@all
  end


  def save
    self.class.all << self
  end


end
