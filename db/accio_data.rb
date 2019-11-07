require_relative('../models/student.rb')
require_relative('../models/house.rb')
require('pry')

house1 = House.new({
  'house_name' => "Hufflepuff"})

house2 = House.new({
  'house_name' => "Slytherin"})

house3 = House.new({
  'house_name' => "Gryffindor"})

house4 = House.new({
  'house_name' => "Ravenclaw"})

student1 = Student.new({
'first_name' => "Neville",
'second_name' => "Shortbuttocks",
'house_id' => "Gryffindor",
'age' => 11
  })

student2 = Student.new({
'first_name' => "Crabby",
'second_name' => "Mcdoyle",
'house_id' => "Slytherin",
'age' => 13
  })




house1.save
house2.save
house3.save
house4.save
student1.save
student2.save

binding.pry

nil
