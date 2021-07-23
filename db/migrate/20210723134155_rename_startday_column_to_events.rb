class RenameStartdayColumnToEvents < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :startday, :start_time
  end
end
