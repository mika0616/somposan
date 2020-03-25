class RemoveScoreFromAnswerUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :answer_users, :score, :integer
  end
end
