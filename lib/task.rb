class Task < ActiveRecord::Base
  validates(:description, :presence => true)
  validates(:description, {:presence => true, :length => { :maximum => 50 }})
  scope(:not_done, -> do
    where({:done => false})
  end)

  belongs_to(:list)
end
