require 'page'
require 'title'

class Template
  attr_accessor( :title, :content )

  def initialize
    @title = 'Pivoqueue'
  end
  
  def to_html
    page = Page.new do
      head.title = 'pivoqueue - login'
      head.charset = 'UTF-8'
      head.icon = 'favicon.ico'
      head.include_css('http://yui.yahooapis.com/2.8.1/build/reset/reset-min.css')
      head.include_css('style.css')
    end
    page.add Title.new(@title)
    page.add @content
    page.to_html
  end
end
