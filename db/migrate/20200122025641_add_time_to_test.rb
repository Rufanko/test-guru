class AddTimeToTest < ActiveRecord::Migration[6.0]
  def change
    add column :tests, :timer, :integer, defailt: 0
  end
end
