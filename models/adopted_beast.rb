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

end
