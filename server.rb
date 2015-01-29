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
#task class should only worry about creating the task & it's status (complete or not)
class Task
	def add_task(array, task, time)		
		array[task] = time
	end
	def complete?(array, task)
		
	end

end


#the hash is concerned w/who is inside it and who has been removed/removing them
def delete_task(array, item)
	array.delete(item)
end



get "/" do
	@tasks = todos
	erb :todo
end

post "/added" do
	t = Time.now
	params[:task] = Task.new
	params[:task].add_task(todos, params[:task], t.strftime("%l:%M%P"))
	redirect to("/")
end

post "/save/:key" do
	# todos[params[:doneness]] = value
	list.complete?(params[:key])
	status(200)
	"Success"
	redirect to("/")
end

post "/delete/:key" do #can only get params from form names and url
	list.delete_task(params[:key])
	status(200)
	"Success"
end



