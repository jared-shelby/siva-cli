## COMMAND LINE INTERFACE CLASS

class CLI

    # initialize by providing access to animator class
    def initialize
        @animator = Animator.new
        @animator.clear
        @customer = nil
    end

    # greet user
    def greet
        @animator.banner("Welcome to SIVA, the transaction network that connects customers & merchants.")
    end

    # initiate login
    def login
        @animator.clear
        @animator.banner("SIVA Login")
        print "Please enter your full name: "
        name = gets.chomp
        name = name.split(" ")
        @customer = Customer.find_by(first_name: name[0], last_name: name[1])
        if @customer == nil
            puts "Error: incorrect account details."
            self.login
        else
            puts "Account found!"
            sleep(1)
            @animator.palette("Account details:", [@customer.inspect])
            sleep(1)
            @animator.clear
            @animator.loading("Logging you in")
            @animator.banner("Welcome back, #{@customer.first_name}.")
        end
    end

    # quit application
    def quit
        @animator.loading("Qutting application")
        puts "Goodbye."
    end

    def pre_login
        # display options & wait for input
        @animator.palette("Please choose an option to continue:", ["1: Login", "2: Quit"])

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