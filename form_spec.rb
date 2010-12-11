require 'form'

describe Form do
  it "when created is empty" do
    Form.new.to_html.should == "<form></form>"
  end
  it "uses the method assigned" do
    form = Form.new
    form.method="post"
    form.to_html.should == '<form method="post"></form>'
  end
  it "contains input tag when inserted" do
    form = Form.new
    form.add_input("Nome", "id")
    form.to_html.should == '<form><label for="id">Nome</label><input id="id" name="id" type="text"></form>'
  end
  it "contains button when inserted" do
    form = Form.new
    form.add_button "Label"
    form.to_html.should == '<form><input type="submit" value="Label"></form>'
  end
  it "can build form in a block" do
    form_block = Form.new { add_button "Label" }
    form = Form.new
    form.add_button "Label"
    form_block.to_html.should == form.to_html
  end
end
