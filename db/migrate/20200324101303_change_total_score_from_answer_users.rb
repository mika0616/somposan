class ChangeTotalScoreFromAnswerUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :answer_users, :total_score, default: 0
  	change_column_null :answer_users, :total_score, null: false
  end
end
