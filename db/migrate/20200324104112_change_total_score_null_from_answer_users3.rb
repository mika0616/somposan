class ChangeTotalScoreNullFromAnswerUsers3 < ActiveRecord::Migration[5.2]
  def change
    change_column_null :answer_users, :total_score, false, 0
  end
end
