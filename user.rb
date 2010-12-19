class User
  attr_reader :apikey
  def initialize(request)
    @request = request
    @apikey = @request.cookies['apikey'] if logged?
  end
  def logged?
    @request.cookies.has_key? 'apikey'
  end
end
