class CreateAccidents < ActiveRecord::Migration[5.2]
  def change
    create_table :accidents do |t|
      t.integer :question_user_id, null: false
      t.integer :question_id
      t.boolean :status, null: false, default: 0
      t.text :title, null: false
      t.text :body, null: false
      t.string :situation_img_id
      t.text :question_user_damage
      t.text :the_other_damage

      t.timestamps
    end
  end
end
