require("sinatra/activerecord")
require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/task")
require("pg")

get('/') do
  @tasks = Task.all()
  erb(:index)
end

post('tasks') do
  description = params.fetch('description')
  task = Task.new({:description => description, :done => false})
  task.save()
  erb(:success)
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
  erb(:index)
end
