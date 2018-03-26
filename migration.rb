require 'sequel'
# require 'sqlite3'

DB = Sequel.connect('sqlite://movies')

DB.create_table :movies do
    String :title
    String :year
    String :director
    String :cast
    String :genre
    String :notes
end
