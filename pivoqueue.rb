require 'rubygems'

require 'sinatra'
require 'haml'
require 'pivotal-tracker'

PivotalTracker::Client.token = IO.read('./token')

get '/' do
  projects = PivotalTracker::Project.all
  @stories = {}
  @count = 0
  projects.each do |project|
    @stories[project.name] = []
    iteration = PivotalTracker::Iteration.current(project)
    iteration.stories.each do |story|
      unless story.current_state == "accepted"
        @stories[project.name].push story
        @count += 1
      end
    end
  end
  haml :index
end
