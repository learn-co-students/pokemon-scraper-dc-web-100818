class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  
  def initialize(id:, name:, type:, hp: 60, db:)
    @id = id 
    @name = name 
    @type = type
    @hp = hp
    @db = db
  end 
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end 
  
  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = (?)"
    result = db.execute(sql, id)
    
    Pokemon.new(id: result[0][0], name: result[0][1], type: result[0][2], hp: result[0][3], db: db)
  end 

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE name = ?", hp, self.name)
  end 
  
end 