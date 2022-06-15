## COMMAND LINE INTERFACE CLASS

class CLI2

    # initialize w/ animator, logos; & w/o customer
    def initialize
        @animator = Animator.new
        @animator.clear
        @logos = Logos.new
        @customer = nil
        @prompt = TTY::Prompt.new
    end

    # greet user
    def greet
        @animator.typewriter(@logos.siva_logo, 0.0005)
        @animator.typewriter(@logos.subtitle, 0.0005)
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
            sleep(1)
            @animator.loading("Taking you back to the home screen")
            self.pre_login
        else
            puts "Account found!"
            sleep(1)
            @animator.palette("Account details:", [@customer.inspect])
            sleep(1)
            @animator.clear
            @animator.loading("Logging you in")
            self.dashboard
        end
    end

    # quit application
    def quit
        @animator.loading("Qutting application")
        puts "Goodbye."
    end

    # takes an array of valid inputs & validates that user input is valid 
    def validate_input(valid_inputs)
        while true
            user_input = gets.chomp
            puts "Your input: '#{user_input}'."
            sleep(1)
            valid_inputs.include?(user_input) ? break : puts("Invalid input; please try again.")
        end
        user_input
    end

    # logic for command palette that preceeds customer dashboard
    def pre_login
        puts 
        # display options & wait for input
        @animator.palette("Please choose an option to continue:", ["1: Login", "2: Quit"])
        valid_inputs = ["1", "2"]
        actions = {"1" => method(:login), "2" => method(:quit)}

        # the .() ensures the method retrieved from the hash gets executed; neat trick
        actions[validate_input(valid_inputs)].()
    end

    def dashboard
        @animator.clear
        @animator.banner("Welcome back, #{@customer.first_name}.")
        @animator.palette("Please choose an option to continue:", ["1: Make a new transaction", "2: Go to account settings", "3: Logout"])
        valid_inputs = ["1", "2", "3"]
        actions = {"1" => method(:transact), "2" => method(:settings), "3" => method(:quit)}

        actions[validate_input(valid_inputs)].()
    end

    # create a transaction
    def transact
        @animator.clear
        @animator.banner("New transaction")

        @animator.typewriter("We'll need a few details.", 0.05)
        puts
        print "Transaction price: $"
        price = gets.chomp.to_f.round(2)
        puts
        print "Transaction date (YYYY-MM-DD): "
        date = gets.chomp
        puts
        print "Merchant name: "
        merchant = gets.chomp
        merchant_object = Merchant.all.find_by(name: merchant)
        if merchant_object == nil
            # add new merchant
            merchant = Merchant.create(name: merchant)
        else
            merchant = merchant_object
        end

        # add transaction
        puts
        @animator.loading("Creating new transaction")
        new_transaction = Transaction.create(price: price, date: date, customer: @customer, merchant: merchant)
        @animator.banner("Success! Transaction created!")
        @animator.palette(
            "Transaction details:", 
            [
                "Price: $#{new_transaction.price}",
                "Date: #{new_transaction.date}",
                "Customer: #{new_transaction.customer.first_name} #{new_transaction.customer.last_name}",
                "Merchant: #{new_transaction.merchant.name}"
            ]
        )

        # prompt next action

    end

    def settings
        @animator.clear
        @animator.banner("Account Settings")
    end

end