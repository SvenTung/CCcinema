require_relative('../db/sql_runner')

class Film

  attr_accessor :title, :price
  attr_reader :id

  def initialize(details)
    @id = details['id'].to_i() if details['id']
    @title = details['title']
    @price = details['price'].to_i()
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id"
    values = [@title, @price]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM films"
    films_array = SqlRunner.run(sql)
    return films_array.map{|film_hash| Film.new(film_hash)}
  end

  def update()
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def check_customers()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON tickets.customer_id = customer.id WHERE film_id = $1"
    values = [@id]
    customers_array = SqlRunner.run(sql, values)
    return customers_array.map{|customer_hash| Customer.new(customer_hash)}
  end
end
