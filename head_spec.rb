require 'head'

describe Head do
  before(:each) do
    @head = Head.new
  end
  it "should be empty when created" do
    @head.should == "<head></head>\n"
  end
  it "can have a title" do
    @head.title = "Il titolo"
    @head.should == "<head><title>Il titolo</title></head>\n"
  end
  it "can include one or more javascript files" do
    @head.include_js "file.js"
    @head.should == "<head><script type=\"text/javascript\" src=\"file.js\"></script></head>\n"
  end
  it "can include one or more external stylesheet" do
    @head.include_css "file.css"
    @head.should == "<head><link type=\"text/css\" rel=\"stylesheet\" href=\"file.css\" /></head>\n"
  end
  it "can have an icon" do
    @head.icon = "favicon.ico"
    @head.should == "<head><link rel=\"icon\" href=\"favicon.ico\" /></head>\n"
  end
  it "can have a charset" do
    @head.charset ="UTF-8"
    @head.should == "<head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"/></head>\n"
  end
end
