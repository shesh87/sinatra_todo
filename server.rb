require "sinatra"
require "pry"
require "sinatra/reloader" if development?
require "logger"
require "pp"
enable :logger
enable :logger
enable :sessions
set :session_secret, "super secret"



todos = {}
# todos = []

def print_task(todos)
	todos.each do |task|
		@stuff = task
	end
end

# @time = Time.now

get "/" do
	@tasks = todos
	erb :todo
end

post "/added" do
	t = Time.now
	todos[params[:task]] = t.strftime("%l:%M%P")
	# todos << params[:task]
	redirect to("/")
end

get "/tasks" do
	@tasks = todos
	erb :tasks
end