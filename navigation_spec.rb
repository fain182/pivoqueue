require 'navigation'

describe Navigation do
  before(:each) { @navigation = Navigation.new}
  it "has a link to home page" do
    @navigation.to_html.should be_include Link.new('Home').to('/').to_html
  end
  it "has a link to about page" do
    @navigation.to_html.should be_include Link.new('About').to('/about').to_html
  end
  it "is contained in a div#container" do
    @navigation.to_html.should be_include '<div id="navigation">'
  end
end
