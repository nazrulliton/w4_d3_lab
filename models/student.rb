require('pg')
require_relative('../db/sql_runner')

class Student

attr_reader :id, :first_name, :secound_name, :house, :age

def initialize (options)
@id = options['id'].to_i if options['id']
@first_name = options['first_name']
@secound_name = options['secound_name']
@house = options['house']
@age = options['age'].to_i
end

def save()
sql = " INSERT INTO  students
(
  first_name,
  secound_name,
  house,
  age)
  VALUES (
$1, $2, $3, $4)
RETURNING id"
values = [@first_name, @secound_name, @house, @age]
student = SqlRunner.run(sql, values)
@id = student.first()['id'].to_i
end




def self.all()
  sql = " SELECT *
  FROM students;"
  students = SqlRunner.run(sql)
  result = students.map{|student| Student.new(student)}
  return result
end 









end
