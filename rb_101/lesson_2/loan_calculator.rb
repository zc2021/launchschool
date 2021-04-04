# methods
def screenprint(msg)
  Kernel.puts("|| #{msg}")
end

# greet
screenprint('Hello there')
screenprint('Let\'s calculate your loan payment')

# get loan amount
screenprint('First, enter the loan amount [principal] in dollars: $')
principal = Kernel.gets().chomp().to_f()

# get interest rate (APR)
screenprint(
  'Next, enter the yearly interest rate [APR] (decimal or with % sign): '
)
apr = Kernel.gets().chomp()

# get loan duration
screenprint('Finally, enter the length of the loan: ')
loan_duration = Kernel.gets().chomp().to_f

screenprint('Is that in (M)onths or (Y)ears?')
loan_period = Kernel.gets().chomp().downcase()

# clean APR
apr = apr.end_with?('%') ? apr.to_f / 100.00 : apr.to_f

# set monthly interest rate
monthly_interest = apr / 12.0

# set loan duration months
loan_duration = loan_period == 'm' ? loan_duration : loan_duration * 12

# set (calc) monthly payment
payment_amt =
  principal * (monthly_interest / (
    1 - (1 + monthly_interest)**(-loan_duration)))

# print loan stats
screenprint("Your monthly payment will be: $#{payment_amt}")
