=begin
  input: String
  output: string with borders
          horizonal_rule = +---------+
          empty line      = |         |
          message line    = | message |

  datastructure, strings and arrays

  algorithm

=end

class Banner
  def initialize(input_message)
    @message = input_message

  end

  def to_s
    [horizonal_rule, empty_line, message_line, empty_line, horizonal_rule].join("\n")
  end

  private

  def horizonal_rule
    "+-#{"-" * @message.length}-+"
  end
  
  def empty_line
    "| #{" " * @message.length} |"
  end
  
  def message_line
    "| #{@message} |"
  end

end

banner = Banner.new('hello')
puts banner