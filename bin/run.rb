#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"


welcome

character = get_character_from_user.downcase
category = get_category_from_user.downcase

answer = "y"
while answer != "n"
  if category == "film"
    user_find_film(character)
  elsif category == "eye color"
    puts eye_color(character)
  end
  answer = search_again?
    if answer == "y"
      character = get_character_from_user.downcase
      category = get_category_from_user.downcase
    end
end

exit_program
