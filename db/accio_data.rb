require_relative('../models/student')
require('pry')



student1 = Student.new({
'first_name' => "Neville",
'secound_name' => "Shortbuttocks",
'house' => "Gryffindor",
'age' => 11
  })

student2 = Student.new({
'first_name' => "Crabby",
'secound_name' => "Mcdoyle",
'house' => "Slytherin",
'age' => 13
  })

student1.save
student2.save


binding.pry

nil
