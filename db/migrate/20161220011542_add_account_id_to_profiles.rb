class AddAccountIdToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :account_id, :integer, null: false
    add_foreign_key :profiles, :accounts
  end
end
