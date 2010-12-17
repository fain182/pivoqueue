require 'element'

describe Element do
  it "can be converted in a string" do
    element = Element.new
    element.should be_respond_to 'to_s'
  end
  it "has a to_s method like to_html" do
    element = Element.new
    element.to_s.should == element.to_html
  end
  it "compare using to_html" do
    element1 = Element.new
    element2 = Element.new
    element1.should == element2
  end
  it "can be compared with string" do
    element = Element.new
    element.should == 'NOT YET IMPLEMENTED'
  end
end
