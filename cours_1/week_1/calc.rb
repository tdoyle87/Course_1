def number
  puts "give me a number"
  n = gets.chomp.to_f
end

def operator
puts "what would you like to do?"
puts "1) add 2) subtract 3) multiply 4) divide"
puts "pick a operation to perform (1-4)"
o = gets.chomp
end

def mult
    number * number
end

def sub
  number - number
end

def add
  number + number
end

def div
  number / number
end
operator

if operator == "1"
  puts "#{add}"
elsif operator == "2"
  puts "#{sub}"
elsif operator == "3"
  puts "#{mult}"
else operator == "4"
  puts "#{div}"
end



