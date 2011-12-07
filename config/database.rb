
# Connection.new takes host, port
host = 'localhost'
port = Mongo::Connection::DEFAULT_PORT

database_name = case Padrino.env
  when :development then 'beats_development'
  when :test        then 'beats_test'
end

if Padrino.env == :production
  Mongoid.database = Mongo::Connection.new('staff.mongohq.com', 10059).db('beats')
  Mongoid.database.authenticate 'beats', 'beatsdb'
else
  Mongoid.database = Mongo::Connection.new(host, port).db(database_name)
end

# You can also configure Mongoid this way
# Mongoid.configure do |config|
#   name = @settings["database"]
#   host = @settings["host"]
#   config.master = Mongo::Connection.new.db(name)
#   config.slaves = [
#     Mongo::Connection.new(host, @settings["slave_one"]["port"], :slave_ok => true).db(name),
#     Mongo::Connection.new(host, @settings["slave_two"]["port"], :slave_ok => true).db(name)
#   ]
# end
#
# More installation and setup notes are on http://mongoid.org/docs/
