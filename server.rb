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

 #task.new('buy milk')
 #task.complete?

class Task
	
end

def delete_task(array, item)
	array.delete(item)
end




get "/" do
	@tasks = todos
	erb :todo
end

post "/added" do
	t = Time.now
	todos[params[:task]] = t.strftime("%l:%M%P")
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



