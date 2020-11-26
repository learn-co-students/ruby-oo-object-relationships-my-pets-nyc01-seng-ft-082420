require 'pry'
class Owner
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end


  def say_species
    return "I am a #{self.species}."
    binding.pry
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.filter { |cat| cat.owner == self}
  end

  def dogs
    Dog.all.filter { |dog| dog.owner == self}
  end
 

  def buy_cat(name)
    Cat.new(name, self )
  end

  def buy_dog(name)
    Dog.new(name, self )
  end

  def walk_dogs
    dogs.each {| dog | dog.mood = 'happy'}
  end

  def feed_cats
    cats.each {| cat | cat.mood = 'happy'}
  end
  
  def sell_pets
    Cat.all.each do |cat| 
      if cat.owner == self
        cat.mood = 'nervous'
        cat.owner = nil
      end
    end
    Dog.all.each do |dog| 
      if dog.owner == self
        dog.mood = 'nervous'
        dog.owner = nil
      end
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end