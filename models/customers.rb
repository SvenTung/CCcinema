require_relative('../db/sql_runner')

class Customer

  attr_accessor :name, :funds
  attr_reader :id

  def initialize(details)
    @id = details['id'].to_i() if details['id']
    @name = details['name']
    @funds = details['funds']
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customers_array = SqlRunner.run(sql)
    return customers_array.map{|customer_hash| Customer.new(customer_hash)}
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def check_tickets()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON tickets.film_id = films.id WHERE customer_id = $1"
    values = [@id]
    films_array = SqlRunner.run(sql, values)
    return films_array.map{|film_hash| Film.new(film_hash)}
  end

  def check_funds()
    funds_remaining = @funds
    sql = "SELECT films.* FROM films INNER JOIN tickets ON tickets.film_id = films.id WHERE customer_id = $1"
    values = [@id]
    films_array = SqlRunner.run(sql, values)
    films_array.each{|film_hash| funds_remaining -= film_hash['price'].to_i}
    return funds_remaining
  end

  def count_tickets()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON tickets.film_id = films.id WHERE customer_id = $1"
    values = [@id]
    films_array = SqlRunner.run(sql, values)
    return films_array.count
  end
end
