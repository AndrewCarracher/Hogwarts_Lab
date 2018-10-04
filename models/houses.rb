require_relative("../db/sql_runner.rb")

class House

  attr_accessor :name
  attr_reader :id
  # A name
  #
  # Optionally, a url for a logo
  #
  # Create a table for Houses
  #
  # Create a ruby model that can save() the details of a house
  #
  # Seed the database

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
  end

  def save
    sql = "
    INSERT INTO houses
    (name)
    VALUES ($1)
    RETURNING id
    "
    values = [@name]
    student = SqlRunner.run(sql, values).first()
    @id = student["id"].to_i
  end


    def self.delete_all()
      sql = "DELETE FROM houses"
      SqlRunner.run(sql)
    end


    def self.all()
      sql = "SELECT * FROM houses"
      house = SqlRunner.run(sql)
      house_hash = house.map {|house| House.new(house)}
      return house_hash
    end

    def self.find(id)
      sql = "SELECT * FROM houses WHERE id = $1"
      values = [id]
      house = SqlRunner.run(sql, values)
      result = House.new(house)
      return result
    end
end
