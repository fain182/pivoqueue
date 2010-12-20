require 'story'
require 'element'

require 'rubygems'
require 'pivotal-tracker'

class Iteration < Element
  def initialize(user)
    PivotalTracker::Client.token = user.apikey
  end
  def projects
    PivotalTracker::Project.all
  end
  def stories
    all = []
    projects.each do |project|
      project_iteration = PivotalTracker::Iteration.current(project)
      all.push *project_iteration.stories
    end
    all.map{|pv_story|  Story.new(pv_story)}
  end
  def stories_to_do
    stories.select{ |story| story.complete? == false }
  end
  def to_html
    stories = stories_to_do.map do |story|
      story.to_html
    end
    stories.join
  end
end
