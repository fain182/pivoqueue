require 'tag'
require 'element'

class Story < Element
  def initialize(pv_story, project)
    @pv_story = pv_story
    @project = project
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
    icon = '<img src="/icons/'+self.story_type+'.png" class="type" />'
    project = Tag.new('span.project') { }
    project.content = @project
    div = Tag.new('div.story') {}
    div.content= icon + project.to_html + name
    div.to_html
  end
end
