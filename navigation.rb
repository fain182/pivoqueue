require 'tag'
require 'link'

class Navigation < Array
  def initialize
    push Link.new('Home').to('/')
    push Link.new('About').to('/about')
  end
  def to_html
    links = map{ |link| link.to_html }.join('&nbsp;|&nbsp;')
    div = Tag.new('div#navigation'){}
    div.content = links
    div.to_html
  end
end
