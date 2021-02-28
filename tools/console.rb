require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

# Cult initialize (name:, location:, founding_year: (integer), slogan:)
# Follower initialize (name: , age: (integer), life_motto:)
# BloodOath initialize (follower, cult, initiation_date = (string))

locations = ["test location","Mom's basement","Seattle, WA", "Washington, DC", "New York, NY", "in your mind"]
slogans = ["test slogan","Taco Tuesday is Every Day","No more Booms plz","Let there be salmon","There is only one true pizza","Nothing is real except the true despair of existence"]
cult_names = ["Test Cult","Fiesta Folks","Jojo's Peepos","Squake and Bake","Big Greasy Apple","We Be Ennui"]
years = [1801,1975,2018,2013,1901,1985]

test_cult = Cult.new(name: cult_names[0], location: locations[0], founding_year: years[0], slogan: slogans[0])
taco_cult = Cult.new(name: cult_names[1], location: locations[1], founding_year: years[1], slogan: slogans[1])
jojo_cult = Cult.new(name: cult_names[2], location: locations[2], founding_year: years[2], slogan: slogans[2])
sqkr_cult = Cult.new(name: cult_names[3], location: locations[3], founding_year: years[3], slogan: slogans[3])
pizza_cult = Cult.new(name: cult_names[4], location: locations[4], founding_year: years[4], slogan: slogans[4])
sad_cult = Cult.new(name: cult_names[5], location: locations[5], founding_year: years[5], slogan: slogans[5], minimum_age:18)

follower_names = ["test follower name","Paul","Diana","John","Leroy Jenkins","Super Bro"]
mottos = ["test motto", "Live más","I'm lovin' it","It's good to be king","Leeeeroyyyy Jenkinsssss","By all means, yes, be a jerk"]
follower_ages = [50,35,35,27,58,30]

test_follower = Follower.new(name:follower_names[0], age:follower_ages[0], life_motto:mottos[0])
follower1 = Follower.new(name:follower_names[1], age:follower_ages[1], life_motto:mottos[1])
follower2 = Follower.new(name:follower_names[2], age:follower_ages[2], life_motto:mottos[2])
follower3 = Follower.new(name:follower_names[3], age:follower_ages[3], life_motto:mottos[3])
follower4 = Follower.new(name:follower_names[4], age:follower_ages[4], life_motto:mottos[4])
follower5 = Follower.new(name:follower_names[5], age:follower_ages[5], life_motto:mottos[5])
worf = Follower.new(name:"Worf, Son of Mogh", age: 65, life_motto:"Today is a good day to die")

test_blood_oath = BloodOath.new(test_follower,test_cult, "1900-01-01")
blood_oath1 = BloodOath.new(follower2, taco_cult, "1992-02-12")
blood_oath2 = BloodOath.new(follower2, jojo_cult, "2020-07-28")
blood_oath3 = BloodOath.new(follower2, sqkr_cult, "2013-08-23")
blood_oath4 = BloodOath.new(follower1, taco_cult, "1995-03-02")
blood_oath5 = BloodOath.new(follower1, pizza_cult, "1988-05-23")
blood_oath6 = BloodOath.new(follower3, sad_cult, "2012-06-01") 
blood_oath7 = BloodOath.new(follower2, sad_cult, "1985-05-24")

taco_cult2 = Cult.new(name:"Tacos to Heaven", location:locations[1],founding_year:2010, slogan:"Takin' names, takin' tacos")


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits