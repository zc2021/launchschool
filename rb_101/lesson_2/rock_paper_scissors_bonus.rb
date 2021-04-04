require 'yaml'

CONFIG = YAML.load_file('rps_config.yml')
VALID_CHOICES = CONFIG.keys()

messages = []
CONFIG.each_value() do |choice|
  messages << choice["select"]
end

MESSAGE_CHOICES = messages.map() { |choice| choice[0] }
CHECK_CHOICES = messages.map() { |choice| choice[1] }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  CONFIG[first]['wins_against'].include?(second)
end

# stretch goal -> print message describing match
def display_flavor_text(winner, loser)
  idx = CONFIG[winner]['wins_against'].index(loser)
  verb = CONFIG[winner]['verbs'][idx]
  prompt("#{winner.capitalize()} #{verb} #{loser}.")
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def display_grand_winner(grand_winner)
  prompt("#{grand_winner} has 5 wins and is crowned GRAND WINNER!")
end

player_wins = 0
computer_wins = 0

loop do
  selection = ''
  loop do
    prompt("Choose one: #{MESSAGE_CHOICES.join(', ')}")
    selection = Kernel.gets().chomp().downcase()

    if CHECK_CHOICES.include?(selection) ||
       VALID_CHOICES.include?(selection)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  player_choice = ''
  VALID_CHOICES.each() do |option|
    player_choice = option if option == selection ||
                              CONFIG[option]['select'][1] == selection
  end
  player_choice = player_choice.to_s

  computer_choice = VALID_CHOICES.sample()

  Kernel.puts(
    "You chose: #{player_choice}; Computer chose: #{computer_choice}."
  )

  if win?(player_choice, computer_choice)
    player_wins += 1
    display_flavor_text(player_choice, computer_choice)
  elsif win?(computer_choice, player_choice)
    computer_wins += 1
    display_flavor_text(computer_choice, player_choice)
  end

  display_results(player_choice, computer_choice)

  if player_wins == 5
    display_grand_winner("Player")
    player_wins = 0
    computer_wins = 0
  elsif computer_wins == 5
    display_grand_winner("Computer")
    player_wins = 0
    computer_wins = 0
  end

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")
