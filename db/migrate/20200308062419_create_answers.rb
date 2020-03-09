class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :answer_user_id, null: false
      t.integer :question_id, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
