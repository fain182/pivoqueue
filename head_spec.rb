require 'head'

describe Head do
  before(:each) do
    @head = Head.new
  end
  it "should be empty when created" do
    @head.to_html.should == '<head></head>'
  end
  it "can have a title" do
    @head.title = "Il titolo"
    @head.to_html.should == "<head><title>Il titolo</title></head>"
  end
  it "can include one or more javascript files" do
    @head.include_js "file.js"
    @head.to_html.should == '<head><script type="text/javascript" src="file.js"></script></head>'
  end
  it "can include one or more external stylesheet" do
    @head.include_css "file.css"
    @head.to_html.should == '<head><link type="text/css" rel="stylesheet" href="file.css" /></head>'
  end
  it "can have an icon" do
    @head.icon = "favicon.ico"
    @head.to_html.should == '<head><link rel="icon" href="favicon.ico" /></head>'
  end
  it "can have a charset" do
    @head.charset ="UTF-8"
    @head.to_html.should == '<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/></head>'
  end
end
