class ChangeUsertestsTable2 < ActiveRecord::Migration[6.0]
  def change
  	change_table :users_tests do |t|
  	  t.remove :course_id
      t.references :user, foreign_key: true	
      t.references :test, foreign_key: true
      t.timestamps
  end
  end
end
