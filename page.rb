require 'head'
require 'tag'

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
  def doctype
    '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">'+"\n"
  end
  def html_elements
    @elements.inject(''){ |out,el| out += el.to_html}
  end
  def to_html
    doctype + Tag.new('html') do
      "\n"+@head.to_html+
      Tag.new('body'){ html_elements }.to_html+"\n"
    end.to_html
  end
end
