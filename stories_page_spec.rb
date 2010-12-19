require 'error'
require 'stories_page'

describe StoriesPage do
  context "when apikey is wrong" do
    before(:each) do
      user = mock(Object, :logged? => true, :apikey => 'aaa')
      @stories_page = StoriesPage.new user
    end
    it "shows an error with a link to login" do
      @stories_page.should be_include Error.new('API key is not valid.'+Link.new('Return to login').to('/login').to_html).to_html
    end
  end
end
