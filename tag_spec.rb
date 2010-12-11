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
      @tag = Tag.new('b') {"asd"}
    end
    it "contains block between tags" do
      @tag.to_html.should == '<b>asd</b>'
    end
  end
end
