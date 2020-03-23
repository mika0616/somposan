class ChangeQuestionUserIdToFavorites < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :favorites, :answer_user_id, null: true
  end
end
