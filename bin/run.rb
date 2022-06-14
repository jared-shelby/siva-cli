require_relative '../config/environment'

# create CLI & greet user
cli = CLI.new
cli.greet

# display pre-login screen
cli.pre_login
