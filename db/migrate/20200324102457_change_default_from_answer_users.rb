class ChangeDefaultFromAnswerUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column :answer_users, :total_score, :integer, default: 0
  end
end
