require 'sequel'

DB = Sequel.connect('sqlite://movies')
movies_table = DB[:movies]

class Movie < Sequel::Model
end