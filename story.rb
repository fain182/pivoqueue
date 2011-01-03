require 'tag'
require 'element'
require 'story_type_icon'

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
    icon = StoryTypeIcon.new(self.story_type)
    project = Tag.new('span.project') { @project }
    Tag.new('div.story') {
      [icon, project, name].join
    }.to_html
  end
end
