class Title
  def initialize text
    @text = text
  end
  def to_html
    '<H2>'+@text+'</H2>'
  end
end
