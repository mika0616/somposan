class AddAnswerUserIdToSkills < ActiveRecord::Migration[5.2]
  def change
    add_column :skills, :answer_user_id, :integer
  end
end
