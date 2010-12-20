require 'story'

describe Story do
  it "should have all the method of a PivotalTracker Story" do
    pv_story = mock(Object, :current_state => 'accepted')
    story = Story.new(pv_story)
    story.current_state.should == 'accepted'
  end
  it "shows name in html" do
    pv_story = mock(Object, :name => 'new story')
    story = Story.new(pv_story)
    story.should be_include 'new story'
  end
  context "has some tasks" do
    it "should have tasks" do
      pv_story = mock(Object, :tasks => mock(Object, :all=>['test']))
      story = Story.new(pv_story)
      story.should be_has_task
    end
  end
  context "has no tasks" do
    it "shouldn't have tasks" do
      pv_story = mock(Object, :tasks => nil)
      story = Story.new(pv_story)
      story.should_not be_has_task
    end
  end
  context "is accepted" do
    it "is complete" do
      pv_story = mock(Object, :current_state => 'accepted')
      story = Story.new(pv_story)
      story.should be_complete
    end
  end
  context "has another state" do
    it "is not complete" do
      pv_story = mock(Object, :current_state => 'test')
      story = Story.new(pv_story)
      story.should_not be_complete
    end
  end
end
