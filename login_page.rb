require 'form'
require 'template'

class LoginPage
  def to_html
    template = Template.new
    template.content = Form.new do
      add_input 'API key', 'apikey', 'password'
    end
    template.to_html
  end
end
