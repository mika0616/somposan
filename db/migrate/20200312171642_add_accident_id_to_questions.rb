class AddAccidentIdToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :accident_id, :integer
  end
end
