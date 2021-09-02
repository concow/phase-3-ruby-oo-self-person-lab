class Person 
    attr_reader :name, :happiness, :hygiene
    attr_accessor :bank_account                  #allows person to change bank_account amount

    def initialize(name)
        @name = name
        @bank_account = 25
        @happiness = 8
        @hygiene = 8
    end

    #allows person to change happiness
    def happiness=(value)
        @happiness = normalize(value)
    #with clamp
    #@happiness = value.clamp(0, 10)
        # if value > 10
        #     @happiness = 10
        # elsif value < 0
        #     @happiness = 0
        # else
        #     @happiness = value
        # end
    end

    #allows person to change hygiene
    def hygiene=(value)
        @hygiene = normalize(value)
        # if value > 10
        #     @hygiene = 10
        # elsif value < 0
        #     @hygiene = 0
        # else
        #     @hygiene = value
        # end
    end

    def normalize(number)
        if number > 10
            return 10
        elsif number < 0
            return 0
        end
        return number
    end
    
    def happy?
        @happiness > 7
        #self.happiness > 7
    end

    def clean?
        @hygiene > 7
        #self.hygiene > 7
    end


    def get_paid(amount)
        @bank_account += amount
        return "all about the benjamins"
    end

    def take_bath
        self.hygiene += 4
        return "♪ Rub-a-dub just relaxing in the tub ♫"
    end

    def work_out
        self.hygiene -= 3
        self.happiness += 2
        return "♪ another one bites the dust ♫"
    end

    def call_friend(friend)
        self.happiness += 3
        friend.happiness += 3
        return "Hi #{friend.name}! It's #{self.name}. How are you?"
    end

   def start_conversation(friend, topic)
    case topic 
    when "politics"
      [self, friend].each { |person| person.happiness -= 2 }
      "blah blah partisan blah lobbyist"
    when "weather"
      [self, friend].each { |person| person.happiness += 1 }
      "blah blah sun blah rain"
    else
      "blah blah blah blah blah"
    end
  end
end