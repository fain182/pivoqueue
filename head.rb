class Head
  attr_accessor(:title, :icon, :charset)
  def initialize
    @js = []
    @css = []
  end
  def include_js(url)
    @js.push url
  end
  def include_css(url)
    @css.push url
  end
  def to_html
    content = ''
    if @title: content += "<title>#{@title}</title>" end
    if @icon: content += "<link rel=\"icon\" href=\"#{@icon}\" />" end
    if @charset: content += "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=#{@charset}\"/>" end
    @css.each do |url|
      content += "<link type=\"text/css\" rel=\"stylesheet\" href=\"#{url}\" />"
    end
    @js.each do |url|
      content += "<script type=\"text/javascript\" src=\"#{url}\"></script>"
    end
    "<head>"+content+"</head>\n"
  end
end
