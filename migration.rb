require 'sequel'
# require 'sqlite3'

DB = Sequel.connect('sqlite://movies')

DB.create_table :movies do
    primary_key :id
    String :title
    Integer :year
    String :director
    String :cast
    String :genre
    String :notes
end
