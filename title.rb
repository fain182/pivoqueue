class Title
  def initialize text
    @text = text
  end
  def to_html
    '<H1>'+@text+'</H1>'
  end
end