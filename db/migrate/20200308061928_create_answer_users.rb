class CreateAnswerUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.integer :score, null: false, default: 0
      t.integer :level, null: false,default: 0
      t.text :production

      t.timestamps
    end
  end
end
