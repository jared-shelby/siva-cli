require "bundler"
Bundler.require

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: "db/card-network.db")
ActiveRecord::Base.logger = nil

require_all "lib"
