require 'link'

describe Link do
  before(:each) { @link = Link.new('label').to('url') }
  it "has a label" do
    @link.label.should == 'label'
  end
  it "has a url (by default is #)" do
    @link.url.should == 'url'
    Link.new('label').url.should == '#'
  end
  it "can be translated in html" do
    @link.to_html.should == '<a href="url">label</a>'
  end
end
