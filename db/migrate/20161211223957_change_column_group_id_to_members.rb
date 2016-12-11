class ChangeColumnGroupIdToMembers < ActiveRecord::Migration[5.0]
  def up
    change_column :members, :group_id, :integer, null: true
  end

  def down
    change_column :members, :group_id, :integer, null: false
  end
end
