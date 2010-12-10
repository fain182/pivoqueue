require 'page'
require 'form'

describe Page do
  it "has a head" do
    page = Page.new
    page.head.should be_a_kind_of Head
  end
  it "contains doctype and html skeleton" do
    Page.new.to_html.should == '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head></head>
<body></body>
</html>'
  end
  it "can contain some html in the body" do
    page = Page.new
    page.add Form.new
    page.to_html.should == '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head></head>
<body>'+Form.new.to_html+'</body>
</html>'
 
  end
end
