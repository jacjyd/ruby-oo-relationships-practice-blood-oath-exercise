
require 'date'

class Follower

    attr_accessor :name, :age, :life_motto

    @@all_followers = []

    def initialize (name:"Name unknown", age:0, life_motto:"Motto unknown")
        @name       = name
        @age        = age
        @life_motto = life_motto

        @@all_followers << self
    end

    def cults
        BloodOath.all
          .select { |oath| oath.follower == self }
          .map { |oath| oath.cult }
    end

    def join_cult (new_cult)
        if age < new_cult.minimum_age
            "Sorry, this follower is too young for this cult."
        else
            BloodOath.new(self, new_cult, Date.today)
        end
    end

    def my_cults_slogans
        cults.map { |cult| cult.slogan }
            .uniq
    end

    def number_of_cults
        cults.count
    end

    def fellow_cult_members
        cult_friends = []
        cults.each { |cult| cult_friends << cult.followers }
        cult_friends.flatten
            .uniq
            .delete_if { |friend| friend == self }
    end

    def self.all
        @@all_followers
    end

    def self.of_a_certain_age (age)
        all.select { |follower| follower.age >= age }
    end

    def self.most_active
        all.sort { |follower| follower.number_of_cults }
            .last
    end

    def self.top_ten
        all.sort { |follower| follower.number_of_cults } [0,10]
    end
end 