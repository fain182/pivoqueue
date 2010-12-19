require 'rubygems'
require 'sinatra'

require 'user'
require 'login_page'
require 'stories_page'

before do
  content_type :html, 'charset' => 'utf-8'
  @user = User.new request
end

before '/user/*' do
  redirect '/login' unless request.cookies.has_key? 'apikey'
end

get '/' do
  redirect '/user/stories'
end

get '/user/stories' do
  StoriesPage.new(@user).to_html
end

get '/login' do
  LoginPage.new(@user).to_html
end

post '/login' do
  expiration = Time.new + 60*60*24*365 
  response.set_cookie("apikey", { :value=>params['apikey'], :expires=>expiration } )
  redirect '/'
end

get '/logout' do
  response.delete_cookie("apikey")
  redirect '/'
end
