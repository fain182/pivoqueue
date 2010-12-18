class User
  def initialize(request)
    @request = request
  end
  def logged?
    @request.cookies.has_key? 'apikey'
  end
end
