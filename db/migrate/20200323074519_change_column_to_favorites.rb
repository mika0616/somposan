class ChangeColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :favorites, :accident_user_id, null: true
  end
  def change
  	change_column_null :favorites, :question_user_id, null: true
  end
end
