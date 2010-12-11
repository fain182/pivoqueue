require 'title'

describe Title do
  it "should put title inside <H1>" do
    Title.new("text").to_html.should == "<H1>text</H1>"
  end
end
