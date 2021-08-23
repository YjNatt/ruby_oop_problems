class Book
  def initialize(author, title)
    @author = author
    @title  = title
  end

  def to_s
    %("#{self.title}", by #{self.author})
  end

  def title
    @title
  end
  
  def author
    @author
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)