class Tag
  attr_accessor :content
  def initialize(name, &block)
    if name.include? '#'
      name, tag_id = name.split '#'
    end
    @name = name
    @tag_id = tag_id
    @self_closing = ! block_given?
    @content = yield if block_given?
  end

  def to_html
    tag_begin = @tag_id ? "<#{@name} id=\"#{@tag_id}\"" : "<#{@name}"
    if @self_closing 
      tag_begin + " />"
    else
      tag_begin + ">#{@content}</#{@name}>"
    end
  end
end
