class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :first_name, null: false, defalut: ''
      t.string :last_name, null: false, default: ''
      t.references :group, foreign_key: true, null: false

      t.timestamps
    end
  end
end
