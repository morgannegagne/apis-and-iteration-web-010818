require 'rest-client'
require 'json'
require 'pry'
require 'colorize'
require_relative "../lib/command_line_interface.rb"



def find_page(page)
  page_characters = RestClient.get("http://www.swapi.co/api/people/?page=#{page}")
  character_hash = JSON.parse(page_characters)
end

def find_character_films(character)
  page = 1
  films = nil

  character_hash = find_page(page)

  while character_hash["next"] != nil
    character_hash = find_page(page)
    characters = character_hash["results"]

    characters.each do |char|
      if char["name"].downcase.include?(character)
        films = char["films"]
        character_hash["next"] = nil
      end
    end
    page += 1
  end
 films
end


def get_character_movies_from_api(character)
    films = find_character_films(character)
    if films
      char_films = films.collect do |film|
        all_films = RestClient.get(film)
        film_hash = JSON.parse(all_films)
      end
    end
end



def parse_character_movies(films_hash)
  films_hash.each_with_index do |film, idx|
    puts " #{idx + 1}.".colorize(:blue) + " #{film["title"]}\n".colorize(:red) + "\t Director: #{film["director"]}\n" + "\t Release Date: #{film["release_date"]}"
  end
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end




## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
