require 'user'

describe User do
  context "has no cookie" do
    before(:each) do
      @user = User.new({})
    end
    it "makes logged? return false" do
      @user.should_not be_logged
    end
  end
  context "has a cookie named apikeys" do
    before(:each) do
      @user = User.new({'apikeys'=>'aaaaaa'})
    end
    it "makes logged? return true" do
      @user.should be_logged
    end
  end
end
