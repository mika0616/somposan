class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :question_id, null: false
      t.integer :question_user_id, null: false
      t.integer :answer_user_id, null: false

      t.timestamps
    end
  end
end
