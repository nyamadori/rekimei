class RemoveMemberIdFromProfiles < ActiveRecord::Migration[5.0]
  def change
    remove_column :profiles, :member_id, :integer, null: false
  end
end
