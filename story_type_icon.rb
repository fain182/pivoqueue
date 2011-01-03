require 'element'

class StoryTypeIcon < Element
  def initialize(type)
    @type = type
  end
  def to_html
    '<img src="/icons/'+@type+'.png" class="type" />'
  end
end
