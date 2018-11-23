require 'sequel'

module MHGUQuery
  DB = Sequel.connect('sqlite://mhgu.db')
end
