class AddGroupIdToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :group_id, :integer, null: false
    add_index :accounts, [:group_id, :email], unique: true
    add_foreign_key :accounts, :groups
  end
end
