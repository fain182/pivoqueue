require 'page'
require 'title'
require 'element'
require 'navigation'

class Template < Element
  attr_accessor( :title, :content )

  def initialize
    @title = 'Pivoqueue'
    @content = ''
  end
  
  def to_html
    page = Page.new do
      head.title = 'pivoqueue - login'
      head.charset = 'UTF-8'
      head.icon = 'favicon.ico'
      head.include_css('http://yui.yahooapis.com/2.8.1/build/reset/reset-min.css')
      head.include_css('http://fonts.googleapis.com/css?family=Lobster')
      head.include_css('template.css')
    end
    container = Tag.new('div#container') {}
    content = Tag.new('div#content') {}
    content.content = @content.to_html
    title = Title.new(@title)
    navigation = Navigation.new
    container.content = title.to_html + navigation.to_html+content.to_html
    page.add container
    page.to_html
  end
end
