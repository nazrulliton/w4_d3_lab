require('pg')
require_relative('../db/sql_runner')

class Student

attr_accessor :id, :first_name, :secound_name, :house_id, :age


def initialize (options)
@id = options['id'].to_i if options['id']
@first_name = options['first_name']
@second_name = options['second_name']
@house_id = options['house']
@age = options['age'].to_i
end

def save()
sql = " INSERT INTO  students
(
  first_name,
  second_name,
  house_id,
  age)
  VALUES (
$1, $2, $3, $4)
RETURNING id"
values = [@first_name, @second_name, @house_id, @age]
student = SqlRunner.run(sql, values)
@id = student.first()['id'].to_i
end

def self.find_by_id (id)
 sql = "SELECT * FROM students WHERE id = $1"
 values = [id]
 student = SqlRunner.run(sql, values)
 result = Student.new(student.first)
return result
end



def self.all()
  sql = " SELECT *
  FROM students;"
  students = SqlRunner.run(sql)
  result = students.map{|student| Student.new(student)}
  return result
end

def self.delete()
  sql = "DELETE FROM students;"
  students = SqlRunner.run(sql)
end











end
