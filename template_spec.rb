require 'template'

describe Template do
  it "has a default page title" do
    template = Template.new()
    template.title.should == 'Pivoqueue'
  end
  it "can have a different title" do
    template = Template.new()
    template.title = 'altro'
    template.title.should == 'altro'
  end
  it "has a content" do
    template = Template.new()
    template.content = 'asd'
    template.content.should == 'asd'
  end
  it "shows the content in the html" do
    template = Template.new()
    template.content = "TEST CONTENT"
    template.to_html.should be_include 'TEST CONTENT'
  end
end
