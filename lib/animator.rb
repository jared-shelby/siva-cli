## ANIMATOR CLASS

class Animator
    
    # initialize w/ logo access
    def initialize
        @logos = Logos.new
    end

    # clear terminal & display logos
    def sanitize
        system("clear") || system("cls")
        @logos.title
        @logos.subtitle
    end

    # print message w/ elipses
    def loading(message)
        print "#{message}"
        3.times do
            sleep(0.5)
            print "."
        end
        sleep(0.5)
        puts
    end

    # print palette w/ head (string) & body (array of strings)
    def palette(head, body)
        puts
        puts "*************************************"
        puts head
        puts ""
        puts body
        puts "*************************************"
        puts
    end

    # print letter by letter
    def typewriter(message, speed)
        message.chars.each do |char|
            print(char)
            sleep(speed)
        end
        puts
    end

    # print transaction details
    def display_transaction(transaction)
        "#{transaction.date} -> $#{transaction.price} purchase @ #{transaction.merchant.name}"
    end

    # print merchant details
    def display_merchants(merchants)
        if merchants.count == 0
            puts "No details to display."
        else
            merchants.each do |name, num| 
                puts "* #{name}:"
                puts "   > #{num} purchase#{"s" unless num == 1}"
            end
        end
    end

end
