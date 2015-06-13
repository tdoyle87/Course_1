#oop1.rb

module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehical
@@number_of_vehicles = 0

def self.number_of_vehicles
  puts "This program has created #{@@number_of_vehicles} vehicles"
end

def initialize
  @@number_of_vehicles += 1
end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end
  def speed_up(speed)
    @current_speed += speed
    puts @current_speed
  end

  def slow_down(speed)
    @current_speed -= speed
    puts @current_speed
  end

  def turn_off
    @current_speed = 0
    puts "You have stopped your car and turned it off"
  end

    def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @current_speed = 0
  end

end

class MyCar < Vehical
  NUMBER_OF_DOORS = 4

  class MyCar
  attr_accessor :color
  attr_reader :year
  
  def info 
    puts "Your car is a #{@color}, #{@year} #{@model}"
  end

  def spray_paint(c)
    self.color = c
  end

  def view_model
    puts self.model
  end

  def to_s
    "this car is a #{color}, #{year} #{@model}"
  end
end

#class MyTruck < Vehical
#  
#  include Towable#

#  NUMBER_OF_DOORS = 2
#  end
#end

truck = MyTruck.new("2000", "chevy", "Silverado")
car = MyCar.new("2000", "Chevy", "Corvette")

truck.info
car.info
end