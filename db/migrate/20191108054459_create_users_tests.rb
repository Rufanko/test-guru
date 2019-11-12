class CreateUsersTests < ActiveRecord::Migration[6.0]
  def change
    create_table :user_tests do |t|	
      
      t.timestamps
    end
    add_reference :user_tests, :user, foreign_key: true
    add_reference :user_tests, :test, foreign_key: true
    change_column_null :user_tests, :user_id, false
    change_column_null :user_tests, :test_id, false
  end
end
