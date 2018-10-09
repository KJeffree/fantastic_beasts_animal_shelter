require_relative('../db/sql_runner')

class Adoption

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
    adopted_beast()
    sql = "INSERT INTO adoptions (adoption_date, update_message, owner_id, beast_id)
    VALUES ($1, $2, $3, $4)
    RETURNING id;
    "
    values = [@adoption_date, @update_message, @owner_id, @beast_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM adoptions"
    SqlRunner.run(sql)
  end

  def update(beast)
    edited_beast_old(beast)
    sql = "UPDATE adoptions
    SET (adoption_date, update_message, owner_id, beast_id) = ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@adoption_date, @update_message, @owner_id, @beast_id, @id]
    SqlRunner.run(sql, values)
    adopted_beast()
  end

  def self.all()
    sql = "SELECT * FROM adoptions"
    adoptions = SqlRunner.run(sql)
    all_adoptions = adoptions.map { |adoption| Adoption.new(adoption) }
    return all_adoptions
  end

  def self.find(id)
    sql = "SELECT * FROM adoptions
    WHERE id = $1"
    adoption_array = SqlRunner.run(sql, [id])
    result = Adoption.new(adoption_array.first)
    return result
  end

  def delete()
    adoptable_beast()
    sql = "DELETE FROM adoptions
    WHERE id = $1"
    SqlRunner.run(sql, [@id])
  end

  def owner()
    sql = "Select * FROM owners
    WHERE id = $1"
    owner_array = SqlRunner.run(sql, [@owner_id])
    owner = Owner.new(owner_array.first)
    return owner
  end

  def beast()
    sql = "Select * FROM beasts
    WHERE id = $1"
    beast_array = SqlRunner.run(sql, [@beast_id])
    beast_info = Beast.new(beast_array.first)
    return beast_info
  end

  def adopted_beast()
    sql = "UPDATE beasts
    SET adoption_status = 'adopted'
    WHERE id = $1"
    SqlRunner.run(sql, [@beast_id])
  end

  def adoptable_beast()
    sql = "UPDATE beasts
    SET adoption_status = 'adoptable'
    WHERE id = $1"
    SqlRunner.run(sql, [@beast_id])
  end

  def edited_beast_old(old_beast)
    sql = "UPDATE beasts
    SET adoption_status = 'adoptable'
    WHERE id = $1"
    SqlRunner.run(sql, [old_beast])
  end

end
