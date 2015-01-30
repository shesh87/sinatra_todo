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



 #task.new('buy milk')
 #task.complete?
 class Task
 	attr_reader :task, :time
	def initialize(task)
		@task = task
		t = Time.now
		@time = t.strftime("%l:%M%P")
	end
	def complete?(task)
		
	end

end


#YAML ONLY WORRIES ABOUT STORING EACH TASK
#TASK ONLY WORRIES ABOUT CREATING THE TASK

store = YAML::Store.new ("todo_list.yml")
store.transaction do
	store[:list] = [] if store[:list].nil? # Initialize array only if list doesn't exist
end








get "/" do
	store.transaction do
        @list = store[:list]
    end
	erb :todo2
end

post "/added" do
	cat = Task.new(params[:task])
	store.transaction do
		store[:list].push(cat)
	end
	redirect to("/")
end

# post "/save/:doneness" do
# 	todos[params[:doneness]] = value
# 	status(200)
# 	"Success"
# 	redirect to("/")
# end

post "/delete/:key" do #can only get params from form names and url
	key = params[:key]
	store.transaction do
		store.delete(key)
	end
	status(200)
	"Success"
end



