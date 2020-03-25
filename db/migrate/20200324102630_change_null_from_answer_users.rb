class ChangeNullFromAnswerUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :answer_users, :total_score, null: false
  end
end
