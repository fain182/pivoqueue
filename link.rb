class Link
  attr_accessor( :label, :url )

  def initialize(label)
    @label = label
    @url = '#'
  end
  def to(url)
    @url = url
    self
  end
  def to_html
    "<a href=\"#{@url}\">#{@label}</a>"
  end
end
