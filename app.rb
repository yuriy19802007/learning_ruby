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

post '/contacts' do

	@user_name = params[:user_name]
	@user_email = params[:user_email]
	@subject = params[:subject]
	@user_message = params[:user_message]

	erb :contact

	f = File.open './contacts', 'a'
	f.write "name: #{@user_name};email : #{@user_email}\n#{@subject}\n#{@user_message}"
	f.close

end

get '/visit' do
	erb :visit
end

post '/visit' do
	@user_name = params[:user_name]
	@user_phone = params[:user_phone]
	@date_time = params[:date_time]

	f = File.open './public/users.txt', 'a'
	f.write "name : #{@user_name}; phone : #{@user_phone}; date : #{@date_time} \n"
	f.close

end


