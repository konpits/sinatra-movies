
# make a migration file that drops a table

require "sequel"

DB = Sequel.connect('sqlite://movies')

DB.drop_table(:movies)