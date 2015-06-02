#calculator program

def say(msg)
  puts "========= #{msg} =========="
end
  
  say "Pick the number that you want to do "
  say "1) Add 2) Subtract 3) Multiply 4) Divide 5) Temp conversion"
loop do 
  operator = gets.chomp
  if operator >= "6" 
    puts "XXXXXXXXXXXX INVALID INPUT XXXXXXXXXXXX"
    break
  end
    say "Give me a number please"
    num1 = gets.chomp

  if operator == "5" #you will be executing a temp conversion
    say "Is temperatuer in F or C"
    temp_symbol = gets.chomp.downcase.capitalize!
    if temp_symbol == "F"
      c = (num1.to_f - 32)* 5 / 9 #to celsius
      puts "#{c} C"
    elsif temp_symbol =='C'
      f = num1.to_f * 9 / 5 + 32 #to farenheit
      puts "#{f} F"
    else
      puts "XXXXXXXXXXXX INVALID INPUT XXXXXXXXXXXX"
    end
  else  say "Give me another number please"# if operator is not 5 askes for additional input
        num2 = gets.chomp
 end



  if operator == "1" #conditional executes simple math and prints it to the screen
    result = num1.to_i + num2.to_i
    puts "you number is #{result}"
  elsif operator == "2"
    result = num1.to_i - num2.to_i
    puts "your number is #{result}"
  elsif operator == "3"
    result = num1.to_i * num2.to_i
    puts "your number is #{result}"
  else operator == "4"
    result = num1.to_f / num2.to_f
    puts "your number is #{result}"
  end
  break
end