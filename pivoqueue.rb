require 'pp'
require 'rubygems'

require 'sinatra'
require 'haml'
require 'pivotal-tracker'

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
end

before '/user/*' do
  unless request.cookies["apikey"].nil?
    PivotalTracker::Client.token = request.cookies["apikey"]
    @projects = PivotalTracker::Project.all
  else
    redirect '/login'
  end
end

get '/' do
  redirect '/user/stories'
end

get '/user/stories' do
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

get '/login' do
  haml :login
end

post '/login' do
  response.set_cookie("apikey", params['apikey'])
  redirect '/'
end

get '/user/done/:id' do |arg|
  project, id = arg.split('^^')
  project = @projects.detect{|p| p.name == project}
  story = project.stories.find(id.to_i)
  story.update({'current_state' => 'accepted'})
  id
end
