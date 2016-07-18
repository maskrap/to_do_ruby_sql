class Task < ActiveRecord::Base
  belongs_to(:list)

  scope(:not_done, -> do
    where({:done => false})
  end)
end

test_list = List.new({:name => 'Epicodus stuff'})
test_task = test_list.tasks().new({:description => 'learn Active Record'})
test_list.save()
test_task.list()
