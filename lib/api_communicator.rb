require 'rest-client'
require 'json'
require 'pry'
require_relative "../lib/command_line_interface.rb"

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)

  characters = character_hash["results"]

  films = nil

  characters.each do |char|
    if char["name"] == character
      films = char["films"]
    end
  end

if films
  char_films = films.collect do |film|
    all_films = RestClient.get(film)
    film_hash = JSON.parse(all_films)
  end
end

  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end



def parse_character_movies(films_hash)
  films_hash.each_with_index do |film, idx|
    puts " #{idx + 1}. #{film["title"]}\n Director: #{film["director"]}\n Release Date: #{film["release_date"]}"
  end

  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)

end




## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
