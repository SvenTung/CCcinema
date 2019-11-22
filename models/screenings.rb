require_relative('../db/sql_runner')

class Screening

  attr_reader :id, :film_id, :screening_time

  def initialize(details)
    @id = details['id'].to_i() if details['id']
    @film_id = details['film_id']
    @screening_time = details['screening_time']
  end

  def save()
    sql = "INSERT INTO screenings (film_id, screening_time) VALUES ($1, $2) RETURNING id"
    values = [@film_id, @screening_time]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM screenings"
    screenings_array = SqlRunner.run(sql)
    return screenings_array.map{|screening_hash| Screening.new(screening_hash)}
  end

  def update()
    sql = "UPDATE screenings SET (film_id, screening_time) = ($1, $2) WHERE id = $3"
    values = [@film_id, @screening_time, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end
  
end
