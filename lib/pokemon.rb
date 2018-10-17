class Pokemon
  attr_accessor :id, :name, :type, :hp, :db
  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_num, db)
    found_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num).flatten
    Pokemon.new(id: found_pokemon[0], name: found_pokemon[1], type: found_pokemon[2], hp: 60, db: db)
  end

  def alter_hp(id_num, new_hp)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, id_num)
  end


end
