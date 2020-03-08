class CreateQuestionUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :question_users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password, null: false

      t.timestamps
    end
  end
end
