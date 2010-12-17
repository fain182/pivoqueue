require 'element'
require 'tag'

class Hint <Element
  def initialize( message )
    @message = message
  end
  def to_html
    hint = Tag.new('div.hint') {
      Tag.new('b'){'Hint:'}.to_html + " " +@message
    }
    hint.to_html
  end
end
