
require 'date'

class BloodOath

    attr_accessor :initiation_date, :follower, :cult

    @@all_oaths = []


    def initialize (follower, cult, initiation_date = Date.today)
        @follower = follower
        @cult = cult

        if initiation_date.class == Date
            @initiation_date = "#{initiation_date}"
        else 
            @initiation_date = initiation_date
        end

        @@all_oaths << self
    end


    def self.all
        @@all_oaths
    end

end