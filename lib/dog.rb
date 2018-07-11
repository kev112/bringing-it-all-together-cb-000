class Dog 
  attr_accessor :id, :name, :breed
  
  def initialize(id: nil, name:, breed:)
    @id = id
    @name = name
    @breed = breed
  end
  
  def save
    if id
      update
    else
      sql = <<-SQL
        INSERT INTO dogs (name, value)
        VALUES (?, ?)
      SQL
      DB[:conn].execute(sql, name, breed)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
    end
  end
  
  def update
    sql = "UPDATE dogs SET name = ?, breed = ?  WHERE id = ?"
    DB[:conn].execute(sql, self.name, self.breed, self.id)
  end

  
  def self.create(name:,breed:)

  end
  
  def self.find_or_create_by(name:, breed:)
    dog = DB[:conn].execute("SELECT * FROM dogs WHERE name = ? AND breed = ?", name, breed)
    if !dog.empty?
      dog_data = dog[0]
      dog= dog.new(dog_data[0], dog_data[1], dog_data[2])
    else
      dog= self.create(name: name, breed: breed)
    end
    dog
  end 
  
end
      