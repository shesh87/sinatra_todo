require "sinatra"
require "pry"
require "sinatra/reloader" if development?
require "logger"
enable :logger

def add_task
	
end

get "/todo-list" do

	task.add_task("buy food")
	# @task = "dog"
	# @task = "buy food"
	erb :todo
end

post "/adding" do
	redirect to("/added-task")
end

get "/added-task" do
	"You're added #{params[:task]} to your To Do list."
end