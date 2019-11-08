class AddTestQuestionsNullConstraint < ActiveRecord::Migration[6.0]
  def change
  	change_column_null(:questions, :content, false)
  end
end
