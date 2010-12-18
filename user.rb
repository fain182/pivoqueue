class User
  def initialize(cookies)
    @cookies = cookies
  end
  def logged?
    @cookies.has_key? 'apikeys'
  end
end
