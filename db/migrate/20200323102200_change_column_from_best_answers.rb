class ChangeColumnFromBestAnswers < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :best_answers, :answer_user_id, null: false
  end
end
