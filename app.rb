#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end
get '/about' do
	erb :about
end

get '/contacts' do
	erb :contacts
end
get '/visit' do
	erb :visit
end
post '/visit' do
	@user_name = params[:user_name]
	@user_email = params[:user_email]
	@user_phone = params[:user_phone]
	@date_time = params[:date_time]
	@barber = params[:barber]

	@title_mess = 'Thank you!'

	@message = "Dear #{@user_name}, we'll waiting for you at #{@date_time} with #{@barber}"

	f = File.open "./public/users.txt", "a"

	f.write "\nUser: #{@user_name}, phone: #{@user_phone}, Email: #{@user_email}, date and time: #{@date_time}, barber: #{@barber}"
	f.close

	erb :message

end