class ChangeTotalScoreNullFromAnswerUsers2 < ActiveRecord::Migration[5.2]
  def up
    change_column :answer_users, :total_score, :integer, default: 0
  end
  def down
    change_column :answer_users, :total_score, :integer, default: 0, null: false
  end
end
