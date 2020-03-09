class CreateAccesses < ActiveRecord::Migration[5.2]
  def change
    create_table :accesses do |t|
      t.integer :question_id, null: false
      t.integer :count, null: false

      t.timestamps
    end
  end
end
