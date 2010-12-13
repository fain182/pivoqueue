require 'tag'

describe Tag do
  context "when created without block" do
    before(:each) do
      @tag = Tag.new('br')
    end
    it "has a self closing tag" do
      @tag.to_html.should == '<br />'
    end
  end
  context "when created with a block" do
    before(:each) do
      @tag = Tag.new('b') {"bold text"}
    end
    it "contains block between tags" do
      @tag.to_html.should == '<b>bold text</b>'
    end
  end
  it "can have an id in tag name, like div#id" do
    tag = Tag.new('div#asd') {"inside"}
    tag.to_html.should == '<div id="asd">inside</div>'
    tag = Tag.new('br#asd')
    tag.to_html.should == '<br id="asd" />'
  end
end
