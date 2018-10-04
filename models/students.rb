require_relative("../db/sql_runner.rb")

class Student

  attr_accessor :f_name, :l_name, :house_id, :age
  attr_reader :id

  def initialize(options)
    @id = options["id"].to_i
    @f_name = options["f_name"]
    @l_name = options["l_name"]
    @house_id = options["house_id"].to_i
    @age = options["age"].to_i
  end

  def save()
    sql = "
    INSERT INTO students
    (f_name, l_name, house_id, age)
    VALUES($1, $2, $3, $4)
    RETURNING id
    "
    values = [@f_name, @l_name, @house_id, @age]
    student = SqlRunner.run(sql, values).first()
    @id = student["id"].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end


  def self.all()
    sql = "SELECT * FROM students"
    student = SqlRunner.run(sql)
    student_hash = student.map {|student| Student.new(student)}
    return student_hash
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    student = SqlRunner.run(sql, values)
    result = Student.new(student)
    return result
  end

  def find_house()
    sql = "
    SELECTS houses.id FROM houses
    WHERE houses.name = $1
    "

  end


end
