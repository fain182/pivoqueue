require 'tag'
require 'element'

class Story < Element
  def initialize(pv_story)
    @pv_story = pv_story
  end
  def method_missing(symbol, *args)
    @pv_story.send(symbol, *args)
  end
  def has_task?
    @pv_story.tasks.all.length > 0 rescue false
  end
  def complete?
    @pv_story.current_state == 'accepted'
  end
  def to_html
    div = Tag.new('div.story') {}
    div.content= name
    div.to_html
  end
end
