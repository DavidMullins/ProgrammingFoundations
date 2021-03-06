# Ask user for number 1 and number 2
# Ask user for operation to perform
# Perform said opertion and print to screen

def prompt(message)
  puts("=> #{message}")
end

def valid_number?(number)
  number.to_i.nonzero?
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt('Welcome to CALCULATOR! Enter your name: ')

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt('Make sure to use a valid name.')
  else
    break
  end
end

prompt("Hi #{name}!")

loop do
  number1 = ''
  loop do
    prompt('Please enter your first number: ')
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt('your number was not valid.')
    end
  end

  number2 = ''
  loop do
    prompt('Please enter your second number: ')
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt('your number was not valid.')
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) Add
    2) Subtract
    3) Multiply
    4) Divide
  MSG

  prompt(operator_prompt)

  operator = gets.chomp
  loop do
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('Must choose 1,2,3 or 4')
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end

  prompt("Result: #{result}")

  prompt('Would you like to perform another calculation? (Y/N)')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thank you for using the calculator. Good bye!')
