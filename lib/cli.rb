## COMMAND LINE INTERFACE CLASS

class CLI

    # initialize w/ access to the animator, logos, & prompt
    def initialize
        @animator = Animator.new
        @prompt = TTY::Prompt.new
        @customer = nil
        self.sanitize
    end

    # clear terminal & display logos
    def sanitize
        # sanitize terminal
        @animator.clear
        @animator.logos
    end

    # greet w/ logos & wait for user's acknowledgement
    def greet
        @animator.typewriter("Welcome to SIVA.", 0.05)
        @prompt.keypress("Press any key to continue", quiet: true)
    end

    # provide interface prior to logging in as a customer
    def entrance
        action = @prompt.select("Please select an option:", show_help: :always, quiet: true) do |menu|
            menu.choice "Login", method(:login)
            menu.choice "Quit", method(:quit)
        end
        action.()
    end

    # provide login interface
    def login
        # sanitize terminal
        self.sanitize

        # display title
        puts "Login to SIVA"

        # prompt user for login details
        name = @prompt.ask("Enter your full name:") do |q|
            q.required :true, "Value must be provided, or type 'quit' to exit"
        end

        # exit application if necessary; otherwise, sanitize input
        name == "quit" ? self.quit : name = name.split(" ")
        
        # find customer
        @customer = Customer.find_by(first_name: name[0], last_name: name[1])

        # initiate login unless details are invalid
        if @customer == nil
            action = @prompt.select("Invalid login details; try again?", show_help: :always, quiet: true) do |menu|
                menu.choice "Try logging in again", method(:login) 
                menu.choice "Quit application", method(:quit)
            end
            action.()
        else
            puts "Account found."
            @animator.palette(
                "Account details:", 
                [
                    "#{@customer.first_name} #{@customer.last_name}",
                    "#{@customer.card_number}"
                ]
            )
            @animator.loading("Logging you in")
            self.dashboard
        end
    end

    # quit application
    def quit
        @animator.loading("Quitting application")
        puts "Goodbye."
        exit
    end

    # provide dashboard once customer logs in
    def dashboard
        # sanitize terminal
        self.sanitize

        # print title
        puts "Dashboard"

        # provide command palette
        action = @prompt.select("Select an action:", show_help: :always) do |menu|
            menu.choice "Make a new transaction", method(:transact)
            menu.choice "Go to account settings", method(:settings)
            menu.choice "Logout & quit application", method(:quit)
        end
        action.()
    end

    # provide interface for making a new transaction
    def transact
        # sanitize terminal
        self.sanitize

        # display title
        puts "Make a New Transaction"

        # prompt customer for details
        price = @prompt.ask("Transaction price: $") do |q|
            q.required :true
            q.modify :strip
        end
        price = price.to_f.round(2)

        date = @prompt.ask("Transaction date (YYYY-MM-DD):") do |q|
            q.required :true
            q.modify :strip
        end

        merchant = @prompt.ask("Merchant name:") do |q|
            q.required :true
            q.modify :strip
        end
        merchant_object = Merchant.all.find_by(name: merchant)
        merchant_object == nil ? merchant = Merchant.create(name: merchant) : merchant = merchant_object

        # add transaction to database
        @animator.loading("Creating new transaction")
        new_transaction = Transaction.create(price: price, date: date, customer: @customer, merchant: merchant)
        puts "Success! Transaction created!"
        @animator.palette(
            "Transaction details:", 
            [
                "Price: $#{new_transaction.price}",
                "Date: #{new_transaction.date}",
                "Customer: #{new_transaction.customer.first_name} #{new_transaction.customer.last_name}",
                "Merchant: #{new_transaction.merchant.name}"
            ]
        )

        # wait for next action
        @prompt.keypress("Press any key to go back to dashboard", quiet: true)
        self.dashboard
    end

    # provide interface for adjusting account settings
    def settings
        # sanitize terminal
        self.sanitize

        # display title
        puts "Account Settings"

        # provide command palette
        action = @prompt.select("Select an action:", show_help: :always) do |menu|
            menu.choice "Show account details", method(:account_details)
            menu.choice "See merchant details", method(:merchant_details)
            menu.choice "Change my name", method(:change_name)
            menu.choice "Replace lost/stolen card", method(:replace_card)
            menu.choice "Delete a transaction", method(:delete_transaction)
            menu.choice "Go back to dashboard", method(:dashboard)
            menu.choice "Logout & quit application", method(:quit)
        end
        action.()
    end

    # display all account details
    def account_details
        # add a customer-since attribute?
        
        # sanitize terminal
        self.sanitize

        # display title
        puts "All Account Details"

        # display all account details
        @animator.palette(
            "Here's an overview of your SIVA account:", 
            [
                "First name: #{@customer.first_name}",
                "Last name: #{@customer.last_name}",
                "Card number: #{@customer.card_number}",
                "Transactions made: #{@customer.transactions.count}",
                "Total money spent: $#{@customer.transactions.sum(:price)}",
                "Earliest transaction: #{@customer.transactions.minimum(:date)}",
                "Latest transaction: #{@customer.transactions.maximum(:date)}"
            ]
        )
        
        # wait for next action
        @prompt.keypress("Press any key to go back to account settings", quiet: true)
        self.settings
    end

    # display merchant details
    def merchant_details
        # sanitize terminal
        self.sanitize

        # display title
        puts "Merchant Details"

        # show details
        @animator.display_merchants(@customer.merchants)

        # wait for next action
        @prompt.keypress("Press any key to go back to account settings", quiet: true)
        self.settings
    end

    # allows current customer to update their name across the database
    # beware this also changes their login details
    def change_name
        # sanitize terminal
        self.sanitize

        # display title
        puts "Change Name for Your Account"

        # show current name
        puts "Your current name is: #{@customer.first_name} #{@customer.last_name}"

        # prompt for new name
        new_first_name = @prompt.ask("Enter new first name:") do |q|
            q.required :true
            q.modify :strip
        end

        new_last_name = @prompt.ask("Enter new last name:") do |q|
            q.required :true
            q.modify :strip
        end

        @animator.loading("Updating your account details")
        @customer.update(first_name: new_first_name, last_name: new_last_name)
        puts "Success! Your name has been changed."

        # display new card
        @animator.palette(
            "New name details:", 
            [
                "First name: #{@customer.first_name}",
                "Last name: #{@customer.last_name}"
            ]
        )

        # warn user that login details have changed
        puts "*NOTE* Your login details have now changed. Log in using your new name."

        # wait for next action
        @prompt.keypress("Press any key to go back to account settings", quiet: true)
        self.settings
    end

    # gives customer a new card number (w/ the minting animation)
    def replace_card
        # sanitize terminal
        self.sanitize

        # display title
        puts "Replace Lost or Stolen Card"

        # show current card number
        puts "Your current card number is: #{@customer.card_number}"

        # generate new card
        @animator.loading("Deactivating old card")
        # add to blacklisted list of cards
        @animator.loading("Minting new card")
        new_card_number = Faker::Number.unique.number(digits: 16)
        puts "Success! New card minted."
        @animator.loading("Updating your account details")
        @customer.update(card_number: new_card_number)
        puts "Success! Your old card has been deactivated & your new card is active."

        # display new card
        @animator.palette(
            "New card details:", 
            [
                "Card number: #{@customer.card_number}"
            ]
        )

        # wait for next action
        @prompt.keypress("Press any key to go back to account settings", quiet: true)
        self.settings
    end

    # gives customer a list of their transaction that they can delete them from their account (one or multiple)
    def delete_transaction
        # sanitize terminal
        self.sanitize

        # display title
        puts "Delete One or More Transactions From Your Account"

        # prompt user to select transactions they wish to delete from account
        # returns array of transaction ids to delete
        transactions_to_delete = @prompt.multi_select(
            "Choose transaction(s) to delete; scroll for more options; deselect all & press enter to cancel:", 
            show_help: :always, per_page: 10, echo: false
            ) do |menu|
            @customer.transactions.order('date DESC').each do |transaction|
                menu.choice @animator.display_transaction(transaction), transaction.id
            end
        end

        # delete transactions from database
        delete_count = transactions_to_delete.count
        if delete_count > 0
            @animator.loading("Deleting #{transactions_to_delete.count} transaction#{"s" unless delete_count == 1}")
            transactions_to_delete.each do |id|
                Transaction.delete(id)
            end
            puts "Done."
        else
            puts "None deleted."
        end

        # wait for next action
        @prompt.keypress("Press any key to go back to account settings", quiet: true)
        self.settings
    end

end