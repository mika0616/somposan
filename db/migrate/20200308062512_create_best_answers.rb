class CreateBestAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :best_answers do |t|
      t.integer :question_id, null: false
      t.integer :answer_id, null: false

      t.timestamps
    end
  end
end
