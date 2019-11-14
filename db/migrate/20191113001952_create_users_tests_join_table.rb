class CreateUsersTestsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :tests do |t|
       t.index [:user_id, :test_id]
    end
    change_column_null :tests_users, :user_id, false
    change_column_null :tests_users, :test_id, false
  end
end
