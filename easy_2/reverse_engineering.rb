class Transform
  attr_reader :my_data

  def initialize(str)
    @my_data = str
  end

  def self.lowercase(str)
    str.downcase
  end

  def uppercase()
    self.my_data.upcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')