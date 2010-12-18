require 'template'

describe Template do
  before(:each) do
    @user = mock(Object, :logged? => false)
    @template = Template.new(@user)
    @test_string = 'TEST CONTENT'
  end
  it "has a default page title" do
    @template.title.should == 'Pivoqueue'
  end
  it "can have a different title" do
    @template.title = @test_string
    @template.title.should == @test_string
  end
  it "contains navigation" do
    @template.should be_include Navigation.new(@user).to_html
  end
  it "has a content" do
    @template.content = @test_string
    @template.content.should == @test_string
  end
  it "shows the content in the html" do
    @template.content = @test_string
    @template.should be_include @test_string
  end
  it "shows cotent and title in a container div" do
    @template.content = @test_string
    @template.should be_include "<div id=\"container\"><H1>Pivoqueue</H1>#{Navigation.new(@user)}<div id=\"content\">#{@test_string}</div></div>"
  end
end
