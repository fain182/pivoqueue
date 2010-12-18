require 'element'

describe Element do
  before(:each) { @element = Element.new }
  it "can be converted in a string" do
    @element.should be_respond_to 'to_s'
  end
  it "has a to_s method like to_html" do
    @element.to_s.should == @element.to_html
  end
  it "compare using to_html" do
    @element.should == Element.new
  end
  it "can be compared with string" do
    @element.should == 'NOT YET IMPLEMENTED'
  end
  it "can check if include a string" do
    @element.should be_include 'NOT YET'
    @element.should_not be_include 'other'
  end
end
