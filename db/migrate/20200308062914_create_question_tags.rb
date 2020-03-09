class CreateQuestionTags < ActiveRecord::Migration[5.2]
  def change
    create_table :question_tags do |t|
      t.integer :question_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end
  end
end
