class MyCar
  attr_accessor :color
  attr_reader :year


  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @current_speed = 0
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

car = MyCar.new("2000", "Blue", "Ford")
car.info
car.speed_up(50)
car.speed_up(60)
car.slow_down(70)
car.turn_off
car.spray_paint("Red")
car.info
MyCar.gas_milage(230, 6)
puts car