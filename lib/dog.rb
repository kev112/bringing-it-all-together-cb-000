class Dog 
  def self.find_or_create_by(name:, album:)
    song = DB[:conn].execute("SELECT * FROM songs WHERE name = ? AND album = ?", name, album)
    if !song.empty?
      song_data = song[0]
      song = Song.new(song_data[0], song_data[1], song_data[2])
    else
      song = self.create(name: name, album: album)
    end
    song
  end 
end
