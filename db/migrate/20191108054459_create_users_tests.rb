class CreateUsersTests < ActiveRecord::Migration[6.0]
  def change
    create_table :users_tests do |t|
      t.integer :course_id	
      t.integer :user_id
      t.timestamps
    end
  end
end
