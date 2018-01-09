def welcome
  puts "Welcome to Stars Wars API."
end

def get_character_from_user
  puts "Enter a Star Wars Character"
  # use gets to capture the user's input. This method should return that input, downcased.
  gets.chomp.downcase
end

def exit_program
  puts "Goodbye"
end
