

def welcome
  puts "Welcome to Stars Wars API."
end

def get_character_from_user
  puts "Enter a Star Wars Character"
  # use gets to capture the user's input. This method should return that input, downcased.
  gets.chomp.downcase
end

def get_category_from_user
  puts "Enter what you want to know about the character (film/eye color)"
  gets.chomp.downcase
end

def search_again?
  answer = "y"
  puts "Do you want to search again? (y/n)"
  answer = gets.chomp

  while answer != "y" && answer != "n"
    puts "Enter y or n"
    answer = gets.chomp
    if answer == "y"
      character = get_character_from_user.downcase
      category = get_category_from_user.downcase
    end
  end
  answer

end

def user_find_film(character)
  while !find_character_films(character)
    character = get_character_from_user.downcase
  end
  show_character_movies(character)
end

def exit_program
  puts "Goodbye"
end
