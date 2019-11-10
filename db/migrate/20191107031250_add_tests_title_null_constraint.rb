
class AddTestsTitleNullConstraint < ActiveRecord::Migration[6.0]
  def change
  	change_column_default(:tests, :level, from: nil, to: 0)
  	change_column_default(:answers, :correct, from: nil, to: false)

  	change_column_null(:tests, :title, false)
  	change_column_null(:answers, :content, false)
  	change_column_null(:questions, :content, false)
  	change_column_null(:users, :name, false)
  	change_column_null(:categories, :name, false)

  	add_reference :answers, :questions, foreign_key: true
  	add_reference :questions, :tests, foreign_key: true
  	add_reference :tests, :categories, foreign_key: true
  	add_reference :tests, :users, foreign_key: true

  end
end
