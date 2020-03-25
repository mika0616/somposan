class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.integer :answer_user_id
      t.integer :score, null: false
      t.integer :event, null: false

      t.timestamps
    end
  end
end
