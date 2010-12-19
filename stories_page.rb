require 'element'
require 'template'
require 'error'
require 'iteration'

class StoriesPage < Element
  def initialize(user)
    @user = user
    @stories = get_stories
  end
  def get_stories
    begin
      Iteration.new(@user).stories
    rescue RestClient::Request::Unauthorized
      false
    end
  end
  def to_html
    template = Template.new(@user)
    if @stories == false
      error = Error.new('API key is not valid.')
      error.solution('Return to login', '/login')
      template.content = error 
    end
    template.to_html
  end
end
