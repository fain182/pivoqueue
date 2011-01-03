require 'story_type_icon'

describe StoryTypeIcon do
  it "shows an icon of the type of story" do
    icon = StoryTypeIcon.new('type')
    icon.should == '<img src="/icons/type.png" class="type" />'
  end
end

