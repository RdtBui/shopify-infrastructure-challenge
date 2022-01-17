class RemoveStringFromLogs < ActiveRecord::Migration[6.1]
  def change
    remove_column :logs, :string, :string
  end
end
