require('pg')
require_relative('../db/sql_runner')
require_relative('student.rb')

class House
  attr_accessor :id, :house_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @house_name = options['name']
  end

  def save()
    sql = "INSERT INTO houses(
    house_name)
    VALUES
    ($1)
    RETURNING id"
    values = [@house_name]
    house = SqlRunner.run(sql, values)
    @id = house.first()['id'].to_i
  end


  def self.all()
    sql = "SELECT * FROM houses"
    select = SqlRunner.run(sql)
    result = select.map{|house| House.new(house)}
    return result
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM houses
    WHERE id = $1;"
    values = [id]
    select = SqlRunner.run(sql,values)[0]
    return select
  end
  def self.delete()
    sql = "DELETE FROM houses;"
    students = SqlRunner.run(sql)

  end
end
