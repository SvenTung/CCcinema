require_relative('../db/sql_runner')

class Ticket

  attr_reader :id, :customer_id, :film_id

  def initialize(details)
    @id = details['id'].to_i() if details['id']
    @customer_id = details['customer_id']
    @film_id = details['film_id']
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id) VALUES ($1, $2) RETURNING id"
    values = [@customer_id, @film_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    tickets_array = SqlRunner.run(sql)
    return tickets_array.map{|ticket_hash| Ticket.new(ticket_hash)}
  end
end
