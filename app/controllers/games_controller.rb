require 'open-uri'

class GamesController < ApplicationController
  def new
    array = ('a'..'z').to_a
    @letters = []
    @letters << array.sample(10).join(" ")
  end

  def score
		letters = params["letters"].split(" ")
    word = params[:word]
    urlAPI = "https://wagon-dictionary.herokuapp.com/#{word}"
    dict_api = URI.open(urlAPI).read
    api_result = JSON.parse(dict_api)
		if word.chars.all? { |letter| word.count(letter) <= letters.count(letter) } && api_result['found'] == true
			@score = "your word is in the dictionary and your word is in the grid"
    else
			@score = "your word is invalid"
    end
  end
end
