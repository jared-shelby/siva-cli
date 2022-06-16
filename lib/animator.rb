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
        print "\n"
    end

    # print palette w/ head (string) & body (array of strings)
    def palette(head, body)
        puts "\n*************************************"
        puts head
        puts ""
        puts body
        puts "\n*************************************"
    end

    # print letter by letter
    def typewriter(message, speed)
        message.chars.each do |char|
            print(char)
            sleep(speed)
        end
        print "\n"
    end

    # print transaction details
    def display_transaction(transaction)
        "#{transaction.date} -> $#{transaction.price} purchase @ #{transaction.merchant.name}"
    end

    # print merchant details
    def display_merchants(merchants)
        merchants.each do |name, num| 
            puts "* #{name}:"
            puts "\t~ #{num} purchase#{"s" unless num == 1}"
        end
    end

end