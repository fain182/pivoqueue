class Tag
  def initialize(name, &block)
    @name = name
    @self_closing = ! block_given?
    @content = yield if block_given?
  end

  def to_html
    if @self_closing
      "<#{@name} />"
    else
      "<#{@name}>#{@content}</#{@name}>"
    end
  end
end
