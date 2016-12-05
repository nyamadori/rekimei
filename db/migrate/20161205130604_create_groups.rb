class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :slug, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
