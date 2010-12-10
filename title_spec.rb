require 'title'

describe Title do
  it "should put title inside <H2>" do
    Title.new("text").to_html.should == "<H2>text</H2>"
  end
end
