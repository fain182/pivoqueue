require 'rubygems'

require 'sinatra'
require 'haml'
require 'pivotal-tracker'

PivotalTracker::Client.token = IO.read('./token')

get '/' do
  projects = PivotalTracker::Project.all
  @stories = {}
  projects.each do |project|
    @stories[project.name] = []
    iteration = PivotalTracker::Iteration.current(project)
    iteration.stories.each do |story|
      @stories[project.name].push story
    end
  end
  haml :index
end
