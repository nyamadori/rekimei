class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.references :account, foreign_key: true
      t.references :group, foreign_key: true, null: false
      t.index [:group_id, :account_id], unique: true
      t.timestamps
    end
  end
end
