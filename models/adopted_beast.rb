require_relative('../db/sql_runner')

class AdoptedBeast

  attr_reader :id, :owner_id, :beast_id
  attr_accessor :adoption_date, :update_message

  def initialize(options)
    @id = options['id'].to_i
    @adoption_date = options['adoption_date']
    @update_message = options['update_message']
    @owner_id = options['owner_id'].to_i
    @beast_id = options['beast_id'].to_i
  end

  def save()
    sql = "INSERT INTO adopted_beasts (adoption_date, update_message, owner_id, beast_id)
    VALUES ($1, $2, $3, $4)
    RETURNING id"
    values = [@adoption_date, @update_message, @owner_id, @beast_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM adopted_beasts"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE adopted_beasts
    SET (adoption_date, update_message, owner_id, beast_id) = ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@adoption_date, @update_message, @owner_id, @beast_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM adopted_beasts"
    adopted_beasts = SqlRunner.run(sql)
    all_adopted_beasts = adopted_beasts.map { |beast| AdoptedBeast.new(beast) }
    return all_adopted_beasts
  end

end
