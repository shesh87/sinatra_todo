require "sinatra"
require "pry"
require "sinatra/reloader" if development?
require "logger"
require "pp"
enable :logger
enable :logger
enable :sessions
set :session_secret, "super secret"




todos = []

def print_task(todos)
	todos.each do |task|
		@stuff = task
	end
end

# @time = Time.now

get "/" do
	erb :todo
end

post "/added" do
	todos << params[:task]
	# time = Time.now
	redirect to("/tasks")
end

get "/tasks" do
	@tasks = todos
	erb :tasks
end