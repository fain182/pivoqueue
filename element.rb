class String
  def to_html
    self
  end
end

class Element
  def ==(other)
    self.to_html == other.to_html
  end
  def to_html
    "NOT YET IMPLEMENTED"
  end
  def to_s
    self.to_html
  end
  def include?( what )
    to_s.include? what
  end
end
