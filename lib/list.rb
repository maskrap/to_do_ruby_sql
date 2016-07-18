class List < ActiveRecord::Base
  has_many(:tasks)
end

new_list = List.new({:name => 'Epicodus stuff'})
new_list.tasks().new({:description => 'learn Active Record'}) # This would create a new task under that particular list.
new_list.tasks().new({:description => 'pair with somebody new'})
new_list.save() # Saves both the list and all of the new tasks created on that list.
new_list.tasks()
