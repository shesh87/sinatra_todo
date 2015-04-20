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



#TASK ONLY WORRIES ABOUT CREATING THE TASK
 
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

store = YAML::Store.new ("todo_list.yml")
store.transaction do
	store[:list] = [] if store[:list].nil? # Initialize array only if list doesn't exist
end








get "/" do
	store.transaction do
        @list = store[:list]
    end
	erb :todo
end

post "/added" do
	new_item = Task.new(params[:task])
	store.transaction do
		store[:list].push(new_item)
	end
	redirect to("/")
end

post "/save/:index" do
	index = params[:index]
	# binding.pry
	store.transaction do
		store[:list].push(task)
	end

	status(200)
	"Success"
	redirect to("/")
end

post "/delete/:index" do
	#can only get params from form names and url
	index = params[:index].to_i
	store.transaction do
		store[:list].each_index do |item|
			if item == index
				store[:list].delete(store[:list].fetch(item))
			end
		end
	end

	#want to iterate thru yaml store "list" to find the matching index value.
	status(200)
	"Success"
end



