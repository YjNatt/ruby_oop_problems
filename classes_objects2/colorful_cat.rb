class Cat
  COLOR_OF_CAT = "purple"

  attr_reader :name
  
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{self.name} and I'm a #{COLOR_OF_CAT} cat!"
  end
end

kitty = Cat.new("Sophie")
kitty.greet