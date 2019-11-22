require_relative('../db/sql_runner')

class Screening

  attr_accessor :film_title, :screening_time
  attr_reader :id, :film_id

  def initialize(details)
    @id = details['id'].to_i() if details['id']
    @film_id = details['film_id'].to_i
    @screening_time = details['screening_time']
    @film_title = details['film_title']
  end

  def save()
    sql = "SELECT title FROM films WHERE id = $1"
    values = [@film_id]
    film_array = SqlRunner.run(sql, values)
    @film_title = film_array[0]['title']
    sql = "INSERT INTO screenings (film_title, film_id, screening_time) VALUES ($1, $2, $3) RETURNING id"
    values = [@film_title, @film_id, @screening_time]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM screenings"
    screenings_array = SqlRunner.run(sql)
    return screenings_array.map{|screening_hash| Screening.new(screening_hash)}
  end

  def update()
    sql = "UPDATE screenings SET (film_title, film_id, screening_time) = ($1, $2, $3) WHERE id = $4"
    values = [@film_title, @film_id, @screening_time, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end

end
