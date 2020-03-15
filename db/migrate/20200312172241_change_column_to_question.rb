class ChangeColumnToQuestion < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :questions, :accident_id, null: false
  end
end
