class AddTotalScoreToAnswerUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :answer_users, :total_score, :integer
  end
end
