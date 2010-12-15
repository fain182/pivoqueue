require 'login_page'

describe LoginPage do
  before(:each) { @login = LoginPage.new }
  it "contains a form" do
    @login.to_html.should be_include '</form>'
  end
  it "has and apikey field" do
    @login.to_html.should be_include 'name="apikey"' 
  end
  it "has a login button" do
    @login.to_html.should be_include '<input type="submit" value="Login">'
  end
  it "has a link to pivotal tracker profile"  do
    @login.to_html.should be_include Link.new('profile').to('https://www.pivotaltracker.com/profile').to_html
  end
end
