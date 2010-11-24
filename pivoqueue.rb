require 'pp'
require 'rubygems'

require 'sinatra'
require 'haml'
require 'pivotal-tracker'

PivotalTracker::Client.token = IO.read('./token')

class PivotalTracker::Story
  def has_tasks?
    self.tasks.all.length >0 rescue false
  end
  def is_complete?
    self.current_state == 'accepted'
  end
end

before do
  content_type :html, 'charset' => 'utf-8'
  @projects = PivotalTracker::Project.all
end

get '/' do
  @stories = {}
  @empty_projects = []
  @projects.each do |project|
    @stories[project.name] = []
    iteration = PivotalTracker::Iteration.current(project)
    if iteration.stories.empty? 
      @empty_projects.push project.name
    end
    iteration.stories.each do |story|
      unless story.is_complete?
        @stories[project.name].push story
      end
    end
  end
  haml :index
end

get '/done/:id' do |arg|
  project, id = arg.split('^^')
  project = @projects.detect{|p| p.name == project}
  story = project.stories.find(id.to_i)
  story.update({'current_state' => 'accepted'})
  id
end
