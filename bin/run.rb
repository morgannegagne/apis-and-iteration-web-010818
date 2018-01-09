#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
character = get_character_from_user
while !get_character_movies_from_api(character)
  character = get_character_from_user
end
show_character_movies(character)
