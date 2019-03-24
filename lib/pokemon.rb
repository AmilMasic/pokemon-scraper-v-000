class Pokemon
  @@all = []
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  # def self.find (id, db)
  #   @@all.each do |pokemon|
  #     id = pokemon.id
  #   end

  end
# end
