require "pry"

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp:60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
    db.execute(sql, [name, type])
  end

  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE pokemon.id = ?"
    result = db.execute(sql, id).flatten!

    pika = Pokemon.new(id: result[0], name: result[1], type: result[2], hp: result[3], db: db)
    # ''
  end

  def alter_hp(hp, db)
    sql = "UPDATE pokemon SET hp = ? WHERE name = ?"
    db.execute(sql, [hp, self.name])
  end
end
