class Pokemon
  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  # finds a pokemon from the database by their id number and returns a new Pokemon object
  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE pokemon.id = ?"
    result = db.execute(sql, id).flatten
    new_pokemon = Pokemon.new(id: result[0], name: result[1], type: result[2], db: db)
  end
end
