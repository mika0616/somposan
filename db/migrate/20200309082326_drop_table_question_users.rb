class DropTableQuestionUsers < ActiveRecord::Migration[5.2]
  def change
  	drop_table :question_users
  end
end
