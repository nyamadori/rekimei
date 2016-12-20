class DropTableMembers < ActiveRecord::Migration[5.0]
  def up
    remove_foreign_key :members, :accounts
    remove_foreign_key :members, :groups
    remove_foreign_key :profiles, :members
    drop_table :members
  end

  def down
    create_table :members do |t|
      t.references :account, foreign_key: true
      t.references :group, foreign_key: true, null: false
      t.index [:group_id, :account_id], unique: true
      t.timestamps
    end

    change_column :members, :group_id, :integer, null: true
    add_foreign_key :profiles, :members
  end
end
