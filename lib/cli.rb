## COMMAND LINE INTERFACE CLASS

class CLI

    # initialize by providing access to animator class
    def initialize
        @animator = Animator.new
    end

    # greet user
    def greet
        @animator.banner("Welcome to SIVA, the transaction network that connects customers & merchants.")
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

    def pre_login
        # display options & wait for input
        puts ""
        puts "------------------------------------"
        puts "Please choose an option to continue:"
        puts "1: Login"
        puts "2: Quit"
        puts "------------------------------------"
        puts ""

        # store user's decision
        @user_choice = nil

        while true
            @user_input = gets.chomp
            puts "Your input: '#{@user_input}'."
            sleep(1)

            if @user_input == "1"
                @user_choice = 1
                break
            elsif @user_input == "2"
                @user_choice = 2
                break
            else 
                puts "Invalid input; please try again by typing '1' or '2'."
            end
        end
        @user_choice == 1 ? self.login : self.quit
    end

end