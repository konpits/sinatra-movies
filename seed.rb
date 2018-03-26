require 'sequel'
require 'json'
DB = Sequel.connect('sqlite://movies')
movies_table = DB[:movies]

file = File.read('movies.json')
movies = JSON.parse(file)


movies_table.multi_insert(movies)