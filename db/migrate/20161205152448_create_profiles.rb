class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :first_name, default: '', null: false
      t.string :last_name, default: '', null: false
      t.string :school_id, default: '', null: false
      t.text :description
      t.references :member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
