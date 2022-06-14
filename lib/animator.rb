## ANIMATOR CLASS

class Animator
    
    # generate a banner w/ given message & buffer time
    def banner(message)
        puts "-----------------------------------------------------------------------------"
        sleep(0.4)
        puts "-----------------------------------------------------------------------------"
        sleep(0.4)
        puts message
        sleep(0.4)
        puts "-----------------------------------------------------------------------------"
        sleep(0.4)
        puts "-----------------------------------------------------------------------------"
        sleep(1)
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

    # generate a palette w/ directions (string) & user options (array of strings)
    def palette(directions, options)
        puts ""
        puts "*************************************"
        puts directions
        puts ""
        puts options
        puts "*************************************"
        puts ""
    end

end