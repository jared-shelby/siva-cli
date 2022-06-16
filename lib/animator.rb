## ANIMATOR CLASS

class Animator
    
    def initialize
        @logos = Logos.new
    end

    # generate a banner w/ given message & buffer time
    def banner(message)
        border = "-----------------------------------------------------------------------------"
        self.typewriter(border, 0.01)
        self.typewriter(message, 0.05)
        self.typewriter(border, 0.01)
        puts
    end

    # clear screen w/ buffer time
    def clear
        system("clear") || system("cls")
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

    # print letter by letter
    def typewriter(message, speed)
        message.chars.each do |char|
            print(char)
            sleep(speed)
        end
        print "\n"
    end

    # print logos
    def logos
        puts @logos.siva2
        puts @logos.subtitle
    end

end