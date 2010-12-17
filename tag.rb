require 'element'

class Tag < Element
  attr_accessor :content
  def initialize(name, &block)
    if name.include? '#'
      name, @tag_id = name.split '#'
    end
    if name.include? '.'
      name, @tag_class = name.split '.'
    end
    @name = name
    @self_closing = ! block_given?
    @content = yield if block_given?
  end

  def to_html
    tag = "<#{@name}"
    tag += " id=\"#{@tag_id}\"" if @tag_id
    tag += " class=\"#{@tag_class}\"" if @tag_class
    if @self_closing 
      tag + " />"
    else
      tag + ">#{@content}</#{@name}>"
    end
  end
end
