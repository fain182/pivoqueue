require 'doctype'

describe 'Doctype' do
  it "is for transitional xhtml" do
    Doctype.new.should be_include 'xhtml1-transitional.dtd'
  end
end
