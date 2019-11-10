class RemoveRef < ActiveRecord::Migration[6.0]
  def change
  	remove_reference(:questions, :test, index: false)
  	remove_reference(:tests, :questions, index: false)
  	remove_reference(:users, :test, index: false)
  	remove_reference(:categories, :tests, index: false)
  	remove_reference(:tests, :users, index: false)
  end
end
