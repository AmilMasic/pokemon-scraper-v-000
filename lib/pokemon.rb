class Pokemon
  @@all = []
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  # def self.find (id_num, db)
  #   pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
  #   Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], hp: pokemon[3], db: db)
  # end

  def self.find(id, database_connection)
      pokemon = database_connection.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
      name = pokemon[1]
      type = pokemon[2]
      hp = pokemon[3]

       pokemon_inst = Pokemon.new(id: id, name: name, type: type, hp: hp, db: database_connection)
    end

  end
# end
