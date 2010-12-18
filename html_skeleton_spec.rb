require 'html_skeleton'
require 'doctype'
require 'tag'
require 'form'

describe HtmlSkeleton do
  before(:each) { @html = HtmlSkeleton.new}
  it "has a head" do
    @html.head.should be_a_kind_of Head
  end
  it "contains doctype" do
    @html.should be_include Doctype.new.to_html
  end
  it "contains body tag" do
    @html.should be_include Tag.new('body'){}.to_html
  end
  it "can contain some html in the body" do
    @html.add Form.new
    @html.should == "#{Doctype.new}<html>\n<head></head>\n<body>#{Form.new}</body>\n</html>"
  end
  it "accept a block to create page" do
    html_block = HtmlSkeleton.new { head.title="asd" }
    @html.head.title = "asd"
    html_block.should == @html
  end
end
