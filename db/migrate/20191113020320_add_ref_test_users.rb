class AddRefTestUsers < ActiveRecord::Migration[6.0]
  def change
  	add_reference :tests, :author, foreign_key: { to_table: "users"}
  	add_index :tests, [:title, :level], unique: true
  end
end
