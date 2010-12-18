require 'tag'
require 'link'
require 'element'

class Navigation < Element
  def initialize(user)
    @links = []
    @links.push Link.new('Home').to('/')
    @links.push Link.new('About').to('/about')
    @links.push Link.new('Logout').to('/logout') if user.logged?
  end
  def to_html
    links_row = @links.map{ |link| link.to_html }.join('&nbsp;|&nbsp;')
    div = Tag.new('div#navigation'){}
    div.content = links_row
    div.to_html
  end
end
