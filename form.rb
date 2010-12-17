require 'element'

class Form < Element
  attr_accessor :method

  def initialize(&block)
    @content = ''
    if block_given?
      instance_eval &block
    end
  end
  def add_input( label, id, type="text")
    @content += "<label for=\"#{id}\">#{label}</label><input id=\"#{id}\" name=\"#{id}\" type=\"#{type}\">"
  end
  def add_button( label )
    @content += "<input type=\"submit\" value=\"#{label}\">"
  end
  def to_html
    open = method ? "<form method=\"#{@method}\">" : "<form>"
    open + @content + "</form>"
  end
end
