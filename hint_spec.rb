require 'hint'

describe Hint do
  before(:each) do
    @message = 'this is a hint!'
    @hint = Hint.new( @message )
  end
  it "should include 'Hint:' in bold" do
    @hint.should be_include '<b>Hint:</b>'
  end
  it "should be contained in a div with class hint" do
    @hint.should be_include '<div class="hint">'
  end
  it "has a message that should be showed" do
    @hint.should be_include @message
  end
end
