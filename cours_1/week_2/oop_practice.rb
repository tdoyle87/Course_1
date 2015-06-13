#oop_practice.rb

class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)

    @name = n
    @height = h
    @weight = w
  end

  def speak
    puts "#{@name} says Arf!"
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end

sparky = GoodDog.new("Sparky", "12 inches", "25 lbs")
puts sparky.info
sparky.change_info("Fido", "25 inches", "35 lbs")
puts sparky.info