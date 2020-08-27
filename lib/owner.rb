require 'pry'
class Owner
  # code goes here
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.all=(arg)
    @@all = arg
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    # self.all.clear *****
    self.all = []
  end

  def cats
    Cat.all.select { |cat| cat.owner == self}
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.each{ |dog| dog.mood = "happy"}
  end

  def feed_cats
    Cat.all.each{ |cat| cat.mood = "happy"}
  end

  def sell_pets

  end





end
