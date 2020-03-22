class ChangeColumnNameFromQuestion < ActiveRecord::Migration[5.2]
  def change
  	rename_column :questions, :access_count, :impressions_count
  end
end
