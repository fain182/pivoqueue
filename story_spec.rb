require 'story'

describe Story do
  it "should have all the method of a PivotalTracker Story" do
    pv_story = mock(Object, :current_state => 'accepted')
    story = Story.new(pv_story, 'project')
    story.current_state.should == 'accepted'
  end
  context "in html" do
    before(:each)do
      @pv_story = mock(Object, 
              :name => 'new story',
              :story_type=>'bug')
      @story = Story.new(@pv_story, 'ppp')
    end
    it "shows name" do
      @story.should be_include @pv_story.name
    end
    it "includes icon of the type" do
      @story.should be_include StoryTypeIcon.new(@pv_story.story_type).to_html
    end
    it "should show project name" do
      @story.should be_include 'ppp'
    end
  end
  context "has some tasks" do
    it "should have tasks" do
      pv_story = mock(Object, :tasks => mock(Object, :all=>['test']))
      story = Story.new(pv_story, 'project')
      story.should be_has_task
    end
  end
  context "has no tasks" do
    it "shouldn't have tasks" do
      pv_story = mock(Object, :tasks => nil)
      story = Story.new(pv_story, 'project')
      story.should_not be_has_task
    end
  end
  context "is accepted" do
    it "is complete" do
      pv_story = mock(Object, :current_state => 'accepted')
      story = Story.new(pv_story, 'project')
      story.should be_complete
    end
  end
  context "has another state" do
    it "is not complete" do
      pv_story = mock(Object, :current_state => 'test')
      story = Story.new(pv_story, 'project')
      story.should_not be_complete
    end
  end
end
