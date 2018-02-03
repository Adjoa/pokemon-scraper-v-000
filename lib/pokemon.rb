class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(pokemon, hp = nil)
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)", [name, type])
  end

  def self.find(id, db)
    pk_arr = db.execute("SELECT * FROM Pokemon WHERE id = ?", [id])
    pk_hash = {id: pk[0][0], name: pk[0][1], type:pk[0][2], db: db}
    Pokemon.new(pk_hash, 60)
  end

  def BONUS
    db.execute("ALTER TABLE pokemon ADD COLUMN hp INTEGER NOT NULL DEFAULT(60)")
  end
end
