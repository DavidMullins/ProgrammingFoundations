require 'pry'

# Ask user for intial loan amount

def prompt(message)
  puts("=> #{message}")
end

answer = 'y'

prompt('Welcome to the Car Loan Calculator!')

while answer == 'y'
  prompt('Please enter you loan amount in dollars(EX: 500 = $500): ')

  # Make sure valid loan amount is entered

  loan = ""

  loop do
    loan = gets.chomp
    if loan.empty? || loan.to_f <= 0
      prompt('Your intial loan amount needs to be a number greater than 0: ')
    else break
    end
  end

  prompt('Please enter your APR(EX: 7.5% = 7.5): ')

  # Make sure valid APR is entered (REGEX to make sure float only)
  # (Value of 0 needs to be allowed...)

  apr = ""

  loop do
    apr = gets.chomp
    if apr.empty? || apr.to_f < 0 || !/^\d+\.?\d+$/.match(apr)
      prompt('Your APR needs to be a non negative number: ')
    else break
    end
  end

  prompt('Please enter the duration of your loan in months(EX: 2 yrs. = 24): ')

  # Make sure valid duration is entered

  duration = ""

  loop do
    duration = gets.chomp
    if duration.empty? || duration.to_f <= 0
      prompt('Your loan needs to have a duration of at least 1 month: ')
    else break
    end
  end

  # Calculate monthly interest rate

  monthly_interest = (apr.to_f / 12) / 100

  # Calculate monthly payment

  monthly_payment = loan.to_f * (monthly_interest.to_f /
    (1 - (1 + monthly_interest.to_f)**-duration.to_f))

  # Display Monthly payments

  prompt("Your payment is: $#{format('%.2f', monthly_payment)} / mo.")

  puts ""

  prompt("Would you like to do another calculation? (Y/N)")

  loop do
    answer = gets.chomp.downcase
    if %w(y n).include? answer
      break
    else
      prompt('Type "Y" to do another calculation or "N" to end the program: ')
    end
  end
end
