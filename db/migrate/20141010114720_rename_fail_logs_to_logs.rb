class RenameFailLogsToLogs < ActiveRecord::Migration
  def change
    rename_column :imported_pets, :fail_logs, :logs
  end
end
