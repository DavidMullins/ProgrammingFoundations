# Ask user for number 1 and number 2
# Ask user for operation to perform
# Perform said opertion and print to screen

puts "Welcome to CALCULATOR"
puts "Please enter your first number: "
number1 = gets.chomp

puts "Please enter your second number: "
number2 = gets.chomp

puts "Please choose your operator: 1) Add  2) Subtract  3) Multiply  4) Divide "
operator = gets.chomp

if operator == "1"
  answer = number1.to_i + number2.to_i
elsif operator == "2"
  answer = number1.to_i - number2.to_i
elsif operator == "3"
  answer = number1.to_i * number2.to_i
else
  answer = number1.to_f / number2.to_f
end

puts "Answer: #{answer}"
