class AddStatusToSkills < ActiveRecord::Migration[5.2]
  def change
    add_column :skills, :status, :boolean
    add_column :skills, :career, :integer
    add_column :skills, :speciality, :integer
    add_column :skills, :qualification, :integer
  end
end
