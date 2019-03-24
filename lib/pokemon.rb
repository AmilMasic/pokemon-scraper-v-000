class Pokemon
  @@all = []
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, hp: nil)
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

  def self.find(num, db)
   pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", [num])
   new_pokemon = self.new(pokemon)
   new_pokemon.id = pokemon[0][0]
   new_pokemon.name = pokemon[0][1]
   new_pokemon.type = pokemon[0][2]
   new_pokemon.hp = pokemon[0][3]
   return new_pokemon
 end

  end
# end
