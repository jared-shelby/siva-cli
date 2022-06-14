## COMMAND LINE INTERFACE CLASS

class CLI

    # greet user
    def greet
        puts ""
        puts "---------------------------------------------------"
        puts "---------------------------------------------------"
        puts "Welcome to SIVA, the card network that's different."
        puts "---------------------------------------------------"
        puts "---------------------------------------------------"
        puts ""
    end

    # clear screen
    def clear
        sleep(0.5)
        system("clear") || system("cls")
        sleep(0.5)
    end

    # initiate login
    def login
        self.clear
        print "Logging you in"
        sleep(0.5)
        print "."
        sleep(0.5)
        print "."
        sleep(0.5)
        print ".\n"
        sleep(1)
        puts "Success!"
    end

    # quit application
    def quit
        puts "Qutting application..."
        puts "Goodbye."
    end

end