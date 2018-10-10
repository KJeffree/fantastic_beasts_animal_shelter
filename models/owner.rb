require_relative('../db/sql_runner.rb')

class Owner

  attr_reader :id
  attr_accessor :first_name, :last_name, :location

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @location = options['location']
  end

  def save()
    sql = "INSERT INTO owners (first_name, last_name, location)
    VALUES ($1, $2, $3)
    RETURNING id"
    values = [@first_name, @last_name, @location]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM owners"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE owners
    SET (first_name, last_name, location) = ($1, $2, $3)
    WHERE id = $4"
    values = [@first_name, @last_name, @location, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM owners"
    owners = SqlRunner.run(sql)
    all_owners = owners.map { |owner| Owner.new(owner) }
    return all_owners
  end

  def self.find(id)
    sql = "SELECT * FROM owners
    WHERE id = $1"
    owner_array = SqlRunner.run(sql, [id])
    result = Owner.new(owner_array.first)
    return result
  end

  def delete()
    sql = "DELETE FROM owners
    WHERE id = $1"
    SqlRunner.run(sql, [@id])
  end

  def full_name()
    return "#{@first_name} #{@last_name}"
  end

end
