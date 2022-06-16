## ANIMATOR CLASS

class Animator
    
    # initialize w/ logo access
    def initialize
        @logos = Logos.new
    end

    # clear terminal
    def clear
        system("clear") || system("cls")
    end

    # print logos
    def logos
        @logos.title
        @logos.subtitle
    end

    # print message w/ elipses
    def loading(message)
        print "#{message}"
        sleep(0.5)
        print "."
        sleep(0.5)
        print "."
        sleep(0.5)
        print "."
        sleep(0.5)
        print "\n"
    end

    # print palette w/ header (string) & information (array of strings)
    def palette(directions, options)
        puts ""
        puts "*************************************"
        puts directions
        puts ""
        puts options
        puts "*************************************"
        puts ""
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