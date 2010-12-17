require 'page'
require 'form'

describe Page do
  before(:each) { @page = Page.new}
  it "has a head" do
    @page.head.should be_a_kind_of Head
  end
  it "contains doctype and html skeleton" do
    @page.should == '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head></head>
<body></body>
</html>'
  end
  it "can contain some html in the body" do
    @page.add Form.new
    @page.should == "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html>
<head></head>
<body>#{Form.new}</body>
</html>"
  end
  it "accept a block to create page" do
    page_block = Page.new { head.title="asd" }
    @page.head.title = "asd"
    page_block.should == @page
  end
end
