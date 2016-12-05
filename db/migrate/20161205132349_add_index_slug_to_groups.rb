class AddIndexSlugToGroups < ActiveRecord::Migration[5.0]
  def change
    add_index :groups, :slug, unique: true
  end
end
