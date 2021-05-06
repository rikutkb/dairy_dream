class RenameTypeToKind < ActiveRecord::Migration[5.2]
  def change
    rename_column :tags, :type, :kind
  end
end
