class DropTableAnswerUsers < ActiveRecord::Migration[5.2]
  def change
  	drop_table :answer_users
  end
end
