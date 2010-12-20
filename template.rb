require 'html_skeleton'
require 'title'
require 'element'
require 'navigation'

class Template < Element
  attr_accessor( :title, :content )

  def initialize(user)
    @title = 'Pivoqueue'
    @content = ''
    @user = user
  end
  
  def to_html
    html_skeleton = HtmlSkeleton.new do
      head.title = 'Pivoqueue' 
      head.charset = 'UTF-8'
      head.icon = '/favicon.ico'
      head.include_css('http://yui.yahooapis.com/2.8.1/build/reset/reset-min.css')
      head.include_css('http://fonts.googleapis.com/css?family=Lobster')
      head.include_css('/template.css')
      head.include_js('http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js')
      head.include_js('http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js')
      head.include_js('/stories.js')
    end
    container = Tag.new('div#container') {}
    content = Tag.new('div#content') {}
    content.content = @content.to_html
    title = Title.new(@title)
    navigation = Navigation.new(@user)
    container.content = title.to_html + navigation.to_html+content.to_html
    html_skeleton.add container
    html_skeleton.to_html
  end
end
