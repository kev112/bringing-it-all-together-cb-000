class Dog 
  
  attr_accessor :id, :name, :breed
  
  def initialize(id=nil, name, breed)
    @id = id
    @name = name
    @breed = breed
  end
  
  def self.find_or_create_by(name:, album:)
    dog= DB[:conn].execute("SELECT * FROM dogs WHERE name = ? AND album = ?", name, album)
    if !song.empty?
      song_data = song[0]
      dog= Song.new(song_data[0], song_data[1], song_data[2])
    else
      dog= self.create(name: name, album: album)
    end
    song
  end 
  
end
