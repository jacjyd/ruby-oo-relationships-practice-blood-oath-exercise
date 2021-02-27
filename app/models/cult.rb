
require 'date'

class Cult

    attr_accessor :name, :location, :founding_year, :slogan

    @@all_cults = []

    def initialize (name:"Cult name unknown", location:"Location unknown", founding_year:"99999", slogan:"Slogan unknown")
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan

        @@all_cults << self
    end

    def recruit_follower (new_follower)
        BloodOath.new(new_follower, cult, Date.today)
    end

    def followers
        BloodOath.all.select{|oath| oath.cult == self}.map{|oath| oath.follower}
    end

    def cult_population
        followers.count
    end

    def self.all
        @@all_cults
    end

    def self.find_by_name (name)
        all.find{|cult| cult.name == name}
    end

    def self.find_by_location (location)
        all.select{|cult| cult.location == location}
    end

    def self.find_by_founding_year (year)
        all.select{|cult| cult.founding_year == year}
    end

end