require 'pivotal-tracker'

class PivotalTracker::Story
  def has_task?
    self.tasks.all.length > 0 rescue false
  end
  def is_complete?
    self.current_state == 'accepted'
  end
end
