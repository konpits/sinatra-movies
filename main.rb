require 'sequel'

DB = Sequel.connect('sqlite://movies')
movies_table = DB[:movies]

class Movie < Sequel::Model

end

movie = Movie.all

movie.each {|movie| puts movie.title}
