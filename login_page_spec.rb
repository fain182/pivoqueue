require 'login_page'

describe LoginPage do
  before(:each) { @login = LoginPage.new }
  it "contains a form" do
    @login.to_html.should be_include '</form>'
  end
  it "has and apikey field" do
    @login.to_html.should be_include 'name="apikey"' 
  end
end
