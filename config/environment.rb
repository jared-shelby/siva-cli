require "bundler"
Bundler.require

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: "db/card-network.db")
require_all "lib"

# suppress AR/SQL query output to terminal
ActiveRecord::Base.logger = nil
