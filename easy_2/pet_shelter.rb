class Pet
  attr_reader :name, :animal

  def initialize(animal, name)
    @animal = animal
    @name   = name
  end
  def to_s
    "a #{animal} name #{name}"
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def number_of_pets
    pets.length
  end

  def add_pet(pet)
    self.pets << pet
  end

  def print_pets
    puts pets
  end
end

class Shelter
  attr_reader :unadopted_pets

  def initialize
    @owners = {}
    @unadopted_pets = {}
  end

  def adopt(owner, pet)
    owner.add_pet(pet)
    @owners[owner.name] ||= owner
  end

  def print_adoptions
    @owners.each do |name, owner|
      puts "#{name} has adopted the following pets:"
      owner.print_pets
      puts ""
    end
  end

  def print_unadopted_pets
    puts "The Animal Shelter has the following unadopted pets:"
    @unadopted_pets.each do |_, pet|
      puts pet
    end
    puts ""
  end

  def obtain(pet)
    @unadopted_pets[pet.name] ||= pet
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
asta         = Pet.new("dog", "Asta")
fluffy = Pet.new("cat", "Fluffy")

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
shelter.obtain(asta)
shelter.obtain(fluffy)
shelter.print_unadopted_pets

puts "The Animal Shelter has #{shelter.unadopted_pets.keys.length} unadopted pets"
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."