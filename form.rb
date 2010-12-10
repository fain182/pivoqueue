class Form
  attr_accessor :method

  def initialize
    @content = ''
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
