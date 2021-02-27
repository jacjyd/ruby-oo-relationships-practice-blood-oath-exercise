
require 'date'

class Follower

    attr_accessor :name, :age, :life_motto

    @@all_followers = []

    def initialize (name:"Name unknown", age:"0", life_motto:"Motto unknown")
        @name = name
        @age = age
        @life_motto = life_motto

        @@all_followers << self
    end

    def cults
        BloodOath.all.select{|oath| oath.follower == self}.map{|oath| oath.cult}
    end

    def join_cult (new_cult)
        BloodOath.new(self, new_cult, Date.today)
    end

    def self.all
        @@all_followers
    end

    def self.of_a_certain_age (age)
        all.select{|follower| follower.age >= age}
    end
end 