require 'pp'
require 'rubygems'

require 'sinatra'
require 'haml'
require 'pivotal-tracker'

PivotalTracker::Client.token = IO.read('./token')

before do
  content_type :html, 'charset' => 'utf-8'
end

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

get '/done/:id' do |arg|
  project, id = arg.split('^^')
  projects = PivotalTracker::Project.all
  project = projects.detect{|p| p.name == project}
  story = project.stories.find(id.to_i)
  story.update({'current_state' => 'accepted'})
  id
end
