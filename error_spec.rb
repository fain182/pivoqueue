require 'error'
require 'link'
require 'tag'

describe Error do
  Message = 'This is an error!'
  before(:each) do
    @error = Error.new(Message)
  end
  it "shows a message" do
    @error.should be_include Message
  end
  it "incapsulates the message in a div with class error" do
    @error.should == Tag.new('div.error') { Message }
  end
  it "can have a link for the solution" do
    @error.solution('what', 'where')
    @error.should == Tag.new('div.error') { Message + Link.new('what').to('where').to_html }
  end
  it "can have a solution withou a link" do
    @error.solution('what')
    @error.should == Tag.new('div.error') { Message + 'what' }
  end
end
