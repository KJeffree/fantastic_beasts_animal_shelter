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

end
