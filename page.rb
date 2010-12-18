require 'element'
require 'doctype'
require 'head'
require 'tag'

class Page < Element
  attr :head
  def initialize(&block)
    @head = Head.new
    @elements = []
    if block_given?
      instance_eval &block
    end
  end
  def add(element)
    @elements.push element
  end
  def html_elements
    @elements.inject(''){ |out,el| out += el.to_html}
  end
  def to_html
    Doctype.new.to_html + Tag.new('html') do
      "\n"+@head.to_html+
      Tag.new('body'){ html_elements }.to_html+"\n"
    end.to_html
  end
end
