class CreateSoluutionReports < ActiveRecord::Migration[5.2]
  def change
    create_table :solution_reports do |t|
      t.integer :accident_id, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
