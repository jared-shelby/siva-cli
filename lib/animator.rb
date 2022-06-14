## ANIMATOR CLASS

class Animator
    
    # generate a banner w/ given message
    def banner(message)
        puts ""
        puts "-----------------------------------------------------------------------------"
        puts "-----------------------------------------------------------------------------"
        puts "#{message}"
        puts "-----------------------------------------------------------------------------"
        puts "-----------------------------------------------------------------------------"
        puts ""
    end

    # clear screen w/ buffer time
    def clear
        sleep(0.5)
        system("clear") || system("cls")
        sleep(0.5)
    end

    # display a message w/ elipses
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

end