class AddAnswerUserIdToBestAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :best_answers, :answer_user_id, :integer
  end
end
