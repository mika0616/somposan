class ChangeColumnToSkills < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :skills, :answer_user_id, null: false
  end
end
