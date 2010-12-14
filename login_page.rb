require 'form'
require 'template'

class LoginPage
  def to_html
    template = Template.new
    login_form = Form.new do
      add_input ' Your API key', 'apikey', 'password'
      add_button 'Login'
    end
    advice = Tag.new('p') do
      'You can find your <i>Pivotal Tracker API key</i> in your <a href="https://www.pivotaltracker.com/profile">profile</a>.'
    end
    template.content = login_form.to_html + advice.to_html
    template.to_html
  end
end
