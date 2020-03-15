class RemoveQuestionIdFromAccidents < ActiveRecord::Migration[5.2]
  def change
    remove_column :accidents, :question_id, :integer
  end
end
