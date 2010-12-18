require 'navigation'

describe Navigation do
  context "user is logged or not" do
    before(:each) do
      user = mock(Object, :logged? => false)
      @navigation = Navigation.new(user)
    end
    it "has a link to home page" do
      @navigation.should be_include Link.new('Home').to('/').to_html
    end
    it "has a link to about page" do
      @navigation.should be_include Link.new('About').to('/about').to_html
    end
    it "is contained in a div#container" do
      @navigation.should be_include '<div id="navigation">'
    end
  end
  context "user is logged" do
    before(:each) do
      user = mock(Object, :logged? => true)
      @navigation = Navigation.new(user)
    end
    it "contains a link to logout" do
      @navigation.should be_include Link.new('Logout').to('/logout').to_html
    end
  end
end
