class AddColumnsToAnswerUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :answer_users, :status, :boolean
    add_column :answer_users, :career, :integer
    add_column :answer_users, :speciality, :integer
    add_column :answer_users, :qualification, :integer
  end
end
