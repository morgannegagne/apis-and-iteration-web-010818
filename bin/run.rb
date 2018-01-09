#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome

character = get_character_from_user.downcase
while !find_character_films(character)
  character = get_character_from_user.downcase
end

answer = "y"
while answer != "n"
  show_character_movies(character)
  puts "Do you want to search again? (y/n)"
  answer = gets.chomp
  if answer == "y"
    character = get_character_from_user.downcase
  elsif answer == "n"
    break
  else
    while answer != "y" && answer != "n"
      puts "Enter y or n"
      answer = gets.chomp
      if answer == "y"
        character = get_character_from_user.downcase
      end
    end

  end
end

exit_program
