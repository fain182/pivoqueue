require 'user'

describe User do
  context "has no cookie" do
    before(:each) do
      request = mock(Object, :cookies=>{})
      @user = User.new(request)
    end
    it "makes logged? return false" do
      @user.should_not be_logged
    end
  end
  context "has a cookie named apikey" do
    before(:each) do
      request = mock(Object, :cookies=>{'apikey'=>'aaa'})
      @user = User.new(request)
    end
    it "makes logged? return true" do
      @user.should be_logged
    end
    it "has apikey as attribute" do
      @user.apikey.should == 'aaa'
    end
  end
end
