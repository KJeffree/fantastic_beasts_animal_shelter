require_relative('../db/sql_runner.rb')

class Beast

  attr_reader :id
  attr_accessor :name, :type, :collection_date, :adoption_status, :characteristics, :diet

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @type = options['type']
    @collection_date = options['collection_date']
    @adoption_status = options['adoption_status']
    @characteristics = options['characteristics']
    @diet = options['diet']
  end

  def save()
    sql = "INSERT INTO beasts (name, type, collection_date, adoption_status, characteristics, diet)
    VALUES ($1, $2, $3, $4, $5, $6)
    RETURNING id"
    values = [@name, @type, @collection_date, @adoption_status, @characteristics, @diet]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM beasts"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE beasts
    SET (name, type, collection_date, adoption_status, characteristics, diet) = ($1, $2, $3, $4, $5, $6)
    WHERE id = $7"
    values = [@name, @type, @collection_date, @adoption_status, @characteristics, @diet, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM beasts"
    beasts = SqlRunner.run(sql)
    all_beasts = beasts.map { |beast| Beast.new(beast) }
    return all_beasts
  end

  def self.find(id)
    sql = "SELECT * FROM beasts
    WHERE id = $1"
    beasts_array = SqlRunner.run(sql, [id])
    result = Beast.new(beasts_array.first)
    return result
  end

  def self.find_type(type)
    sql = "Select * FROM beasts
    WHERE type = $1"
    beasts_array = SqlRunner.run(sql, [type])
    result = beasts_array.map { |beast| Beast.new(beast) }
    return result
  end

  def delete()
    sql = "DELETE FROM beasts
    WHERE id = $1"
    SqlRunner.run(sql, [@id])
  end

  def self.array_of_types()
    sql = "SELECT DISTINCT type FROM beasts"
    type_array = SqlRunner.run(sql)
    result = type_array.map {|beast| beast['type']}
    return result
  end

end
