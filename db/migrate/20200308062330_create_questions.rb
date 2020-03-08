class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :question_user_id, null: false
      t.boolean :status, null: false, default: 0
      t.text :title, null: false
      t.text :body, null: false
      t.integer :access_count, null: false, default: 0

      t.timestamps
    end
  end
end
