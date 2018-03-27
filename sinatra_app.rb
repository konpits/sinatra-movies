require 'sinatra'
require 'time'
require_relative 'model'

# movies = Movie.all

get '/' do
    erb :index
end

post '/submit' do
    Movie.insert(
        {
            title: params[:title],
            year: params[:year],
            director: params[:director],
            cast: params[:cast],
            genre: params[:genre],
            notes: params[:notes]
        }
    )
    "You entered Movie: #{params[:title]}"
end