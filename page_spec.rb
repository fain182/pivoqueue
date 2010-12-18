require 'page'
require 'doctype'
require 'form'

describe Page do
  before(:each) { @page = Page.new}
  it "has a head" do
    @page.head.should be_a_kind_of Head
  end
  it "contains doctype and html skeleton" do
    @page.should == "#{Doctype.new}<html>\n<head></head>\n<body></body>\n</html>"
  end
  it "can contain some html in the body" do
    @page.add Form.new
    @page.should == "#{Doctype.new}<html>\n<head></head>\n<body>#{Form.new}</body>\n</html>"
  end
  it "accept a block to create page" do
    page_block = Page.new { head.title="asd" }
    @page.head.title = "asd"
    page_block.should == @page
  end
end
