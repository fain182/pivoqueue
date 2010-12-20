require 'iteration'

require 'rubygems'
require 'pivotal-tracker'

describe Iteration do
  before(:each) do
    @user = mock(Object, :apikey=>IO.read('.token'))
    @iteration = Iteration.new(@user)
    PivotalTracker::Client.token = @user.apikey
    @projects = PivotalTracker::Project.all
  end
  it "has projects" do
    @projects = @projects.map{ |p| p.name }
    projects = @iteration.projects.map{ |p| p.name }
    projects.should == @projects
  end
  it "has stories" do
    stories = []
    @projects.each do |project|
      iteration = PivotalTracker::Iteration.current(project)
      stories.push *iteration.stories
    end
    stories = stories.map{|s| s.name }
    @iteration.stories.map{|s| s.name} == stories
  end
  it "can select incomplete stories" do
    expected_stories = @iteration.stories.select do |story|
      story.current_state != 'accepted'
    end
    @iteration.stories_to_do.map{|s| s.name}.should == expected_stories.map{|s|s.name}
  end
  it "show stories in html" do
    stories_to_do = @iteration.stories_to_do
    @iteration.should == stories_to_do.map{|s| s.to_html}.join 
  end
end
