require 'rubygems'
require 'pivotal-tracker'

class Iteration
  def initialize(user)
    @user = user
    PivotalTracker::Client.token = @user.apikey
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
    all
  end
end
