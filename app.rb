require("sinatra/activerecord")
require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/task")
require("./lib/list")
require("pg")

get("/") do
  @tasks = Task.all()
  erb(:index)
end

get('/tasks') do
  @tasks = Task.all()
  erb(:tasks)
end

get("/tasks/new") do
  erb(:task_form)
end

post("/tasks") do
  @tasks = Task.all()
  description = params.fetch("description")
  @task = Task.new({:description => description, :done => false})
 if @task.save()
   erb(:tasks)
 else
   erb(:errors)
 end
end

get("/tasks/:id") do
  @task = Task.find(params.fetch("id").to_i())
  erb(:task)
end

get('/tasks/:id/edit') do
  @task = Task.find(params.fetch("id").to_i())
  erb(:task_edit)
end

patch("/tasks/:id") do
  description = params.fetch("description")
  @task = Task.find(params.fetch("id").to_i())
  @task.update({:description => description})
  @tasks = Task.all()
  erb(:tasks)
end
