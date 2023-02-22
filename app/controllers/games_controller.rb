require 'net/http'
require 'json'

class GamesController < ApplicationController
  def new
    @array = (0...10).map { ('a'..'z').to_a[rand(26)] }
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    @fetched = JSON.parse(response)
    params[:word].split("").each do |x|
      if params[:collected_input].include?(x) == true
        params[:collected_input]
        if @fetched["found"] == true
          @resposta = "Congratulations! This is a english word!"
        else
          @resposta = "This isn't a english word!"
        end
      else
        @resposta = "The letters must be in the grid!"
        break
      end
    end
  end
end
