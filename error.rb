require 'tag'
require 'element'
require 'link'

class Error < Element
  def initialize(message)
    @message = message
    @solution = ''
  end
  def solution(what, where='')
    if where != ''
       @solution = Link.new(what).to(where)
    else
      @solution = what
    end
  end
  def to_html
    div = Tag.new('div.error'){}
    div.content = @message + @solution.to_html
    div.to_html
  end
end
