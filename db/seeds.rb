require_relative("../models/students.rb")
require_relative("../models/houses.rb")

Student.delete_all()

student1 = Student.new({
  "f_name" => "Harry",
  "l_name" => "Pooter",
  "house" => "Ravenclaw",
  "age" => 17
  })

student2 = Student.new({
  "f_name" => "Hermione",
  "l_name" => "granger",
  "house" => "Hufflepuff",
  "age" => 14
  })

student1.save()
student2.save()

house1 = House.new({
  "name" => "Hufflepuff"
  })
house2 = House.new({
  "name" => "Ravenclaw"
  })
house3 = House.new({
  "name" => "Gryffindor"
  })
house4 = House.new({
  "name" => "Slytherin"
  })

house1.save()
house2.save()
house3.save()
house4.save()
