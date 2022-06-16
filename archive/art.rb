# generate a banner w/ given message & buffer time
def banner(message)
    border = "-----------------------------------------------------------------------------"
    self.typewriter(border, 0.01)
    self.typewriter(message, 0.05)
    self.typewriter(border, 0.01)
    puts
end

