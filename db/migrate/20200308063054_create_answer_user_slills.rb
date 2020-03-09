class CreateAnswerUserSlills < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_user_slills do |t|
      t.integer :answer_user_id, null: false
      t.integer :skill_id, null: false

      t.timestamps
    end
  end
end
