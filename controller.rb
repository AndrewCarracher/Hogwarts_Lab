require("sinatra")
require("sinatra/contrib/all")
require_relative("./models/students.rb")
also_reload("./models/*")

get("/hogwarts")do
  @students = Student.all()
  erb(:student)
end

get("/hogwarts/new")do
  erb(:new)
end

post("/hogwarts")do
  @students = Student.new(params)
  @students.save
  erb(:creat)
end
