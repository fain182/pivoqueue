require 'template'

describe Template do
  before(:each) do
    @template = Template.new
    @test_string = 'TEST CONTENT'
  end
  it "has a default page title" do
    @template.title.should == 'Pivoqueue'
  end
  it "can have a different title" do
    @template.title = @test_string
    @template.title.should == @test_string
  end
  it "has a content" do
    @template.content = @test_string
    @template.content.should == @test_string
  end
  it "shows the content in the html" do
    @template.content = @test_string
    @template.to_html.should be_include @test_string
  end
  it "shows content and title in a container div" do
    @template.content = @test_string
    @template.to_html.should be_include "<div id=\"container\"><H1>Pivoqueue</H1><div id=\"content\">#{@test_string}</div></div>"
  end
end
