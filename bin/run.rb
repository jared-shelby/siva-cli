require_relative "../config/environment"

#require_relative "../config/warning_suppressor"

# create CLI & greet user
cli = CLI.new
cli.greet

# display pre-login screen
cli.pre_login
