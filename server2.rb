require "sinatra"
require "pry"
require "sinatra/reloader" if development?
require "logger"
require "pp"
require 'yaml/store'
enable :logger
enable :logger
enable :sessions
set :session_secret, "super secret"



TodoList = Struct.new :task, :time
store = YAML::Store.new ("todo_list.txt")

todos = {}
store.transaction do
	store[:list] = {}
end

 #task.new('buy milk')
 #task.complete?







get "/" do
	# @tasks = todos
	store.transaction do
		store[:list]
	end
	erb :todo
end

post "/added" do
	List = Task.new	#list = Task.new
	add_task(params[:task])		#list.add_task("cheese")
	redirect to("/")
end

post "/save/:doneness" do
	todos[params[:doneness]] = value
	status(200)
	"Success"
	redirect to("/")
end

post "/delete/:key" do #can only get params from form names and url
	delete_task(todos, params[:key])
	status(200)
	"Success"
end



