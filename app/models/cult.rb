
require 'date'
require 'pry'

class Cult

    attr_accessor :name, :location, :founding_year, :slogan

    @@all_cults = []

    def initialize (name:"Cult name unknown", location:"Location unknown", founding_year:"99999", slogan:"Slogan unknown")
        @name           = name
        @location       = location
        @founding_year  = founding_year
        @slogan         = slogan

        @@all_cults << self
    end

    def recruit_follower (new_follower)
        BloodOath.new(new_follower, cult, Date.today)
    end

    def followers
        BloodOath.all
          .select { |oath| oath.cult == self }
          .map { |oath| oath.follower }
    end

    def cult_population
        followers.count
    end

    def average_age
        #filter out any followers with default (unknown) age of 0 to disregard
        relevant_followers = followers.delete { |follower| follower.age == 0 }
        total_age = relevant_followers.map { |follower| follower.age }.sum 
        total_age/relevant_followers.count
    end

    def my_followers_mottos
        followers.map { |follower| follower.life_motto }
    end

    def self.all
        @@all_cults
    end

    def self.find_by_name (name)
        all.find { |cult| cult.name == name }
    end

    def self.find_by_location (location)
        all.select { |cult| cult.location == location }
    end

    def self.find_by_founding_year (year)
        all.select { |cult| cult.founding_year == year }
    end

    def self.least_popular
        all.sort_by { |cult| cult.cult_population}
            .last
    end

    def self.most_common_location
        cult_count_by_location = {}
        all.each do |cult|
            cult_count_by_location[cult.location] ||= 0
            cult_count_by_location[cult.location] += 1 
        end

        most_cults = cult_count_by_location.values.sort.max       
        cult_count_by_location.keep_if { |location, count| count == most_cults }.keys
    end
end