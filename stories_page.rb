require 'element'
require 'template'
require 'error'
require 'iteration'

class StoriesPage < Element
  def initialize(user)
    @user = user
  end
  def get_iteration_html
    begin
      Iteration.new(@user).to_html
    rescue RestClient::Request::Unauthorized
      error = Error.new('API key is not valid.')
      error.solution('Return to login', '/login')
    end
  end
  def to_html
    template = Template.new(@user)
    template.content = get_iteration_html
    template.to_html
  end
end
