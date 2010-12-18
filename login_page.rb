require 'form'
require 'hint'
require 'element'
require 'template'

class LoginPage < Element
  def initialize(user)
    @user = user
  end
  def to_html
    template = Template.new(@user)
    login_form = Form.new do
      add_input ' Your API key', 'apikey', 'password'
      add_button 'Login'
    end
    login_form.method = 'POST'
    hint = Hint.new("You can find your Pivotal Tracker API key in your #{Link.new('profile').to('https://www.pivotaltracker.com/profile')}")
    template.content = login_form.to_html + hint.to_html
    template.to_html
  end
end
