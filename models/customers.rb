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
end
