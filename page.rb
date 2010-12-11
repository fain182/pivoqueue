require 'head'

class Page
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
  def to_html
    doctype = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">'
    elements = @elements.inject(''){ |out,el| out += el.to_html}
    doctype + "\n<html>\n#{@head.to_html}\n<body>#{elements}</body>\n</html>"
  end
end
